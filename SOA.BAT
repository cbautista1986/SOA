@ECHO OFF

:: Verificar si se está ejecutando como Administrador
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO El script necesita ser ejecutado como Administrador.
    PAUSE
    EXIT /B
)

:: Función para verificar la versión de Windows
FOR /F "tokens=4-5 delims=. " %%i IN ('ver') DO SET ver=%%i.%%j
IF "%ver%" LSS "10.0" (
    ECHO Windows 10 o superior es recomendado para algunas funciones como Winget.
)

:: Función para verificar si Winget está instalado
winget --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    ECHO Winget no está instalado. Intentando instalar...
    :: Instalador de Winget solo para versiones compatibles
    powershell -Command "Start-Process msiexec.exe -ArgumentList '/i https://aka.ms/getwinget -passive' -Wait"
)

:: Borrando archivos temporales
ECHO *BORRANDO TEMPORALES*
CD /D %TEMP%
DEL *.tmp /S /F /Q
IF %ERRORLEVEL% EQU 0 (
    ECHO Archivos temporales borrados.
) ELSE (
    ECHO No se pudo borrar algunos archivos temporales.
)

:: Actualizando programas
ECHO *ACTUALIZANDO PROGRAMAS*
winget upgrade --all
IF %ERRORLEVEL% EQU 0 (
    ECHO Programas actualizados.
) ELSE (
    ECHO Error al actualizar programas, verifica Winget.
)

:: Analizando integridad de archivos
ECHO *ANALIZANDO INTEGRIDAD DE ARCHIVOS*
SFC /SCANNOW
IF %ERRORLEVEL% EQU 0 (
    ECHO Integridad de archivos analizada.
) ELSE (
    ECHO Error en el análisis de archivos del sistema.
)

:: Analizando errores de sistema operativo
ECHO *ANALIZANDO ERRORES DE SISTEMA OPERATIVO*
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /ScanHealth
IF %ERRORLEVEL% EQU 0 (
    ECHO Análisis de errores del sistema completado.
) ELSE (
    ECHO Error en el análisis de errores del sistema.
)

:: Restablecer configuraciones de red y DNS
ECHO *RESTABLECIENDO CONFIGURACIONES DE RED Y DNS*
netsh int ip reset c:\resetlog.txt
ipconfig /flushdns
netsh winsock reset
IF %ERRORLEVEL% EQU 0 (
    ECHO Configuraciones de red y DNS restablecidas.
) ELSE (
    ECHO Error al restablecer configuraciones de red y DNS.
)

:: Mostrar las interfaces de red activas
ECHO *MOSTRANDO INTERFACES DE RED ACTIVAS*
ipconfig /all

:: Liberar y renovar la dirección IP
ECHO *LIBERANDO Y RENOVANDO DIRECCIÓN IP*
ipconfig /release
ipconfig /renew

:: Limpiar los archivos temporales del sistema
ECHO *LIMPIANDO ARCHIVOS TEMPORALES DEL SISTEMA*
del /q /f /s %TEMP%\*
IF %ERRORLEVEL% EQU 0 (
    ECHO Archivos temporales del sistema limpiados.
) ELSE (
    ECHO No se pudieron limpiar algunos archivos temporales del sistema.
)

:: Actualizar configuración de proxy (si se utiliza proxy)
ECHO *ACTUALIZANDO CONFIGURACIÓN DE PROXY*
netsh winhttp reset proxy

:: Poner la fecha y hora actuales
ECHO *SINCRONIZANDO LA FECHA Y HORA*
w32tm /resync
IF %ERRORLEVEL% EQU 0 (
    ECHO Fecha y hora sincronizadas.
) ELSE (
    ECHO Error al sincronizar la fecha y hora.
)

:: Verificar el estado de conectividad
ECHO *VERIFICANDO CONECTIVIDAD A INTERNET*
ping google.com
IF %ERRORLEVEL% EQU 0 (
    ECHO Conexión a Internet verificada.
) ELSE (
    ECHO No se pudo conectar a Internet.
)

:: Finalización
ECHO Todos los procesos han sido completados.
PAUSE

@ECHO OFF

REM Borrando archivos temporales
ECHO *BORRANDO TEMPORALES*
CD /D %TEMP%
DEL *.tmp /S /F /Q
ECHO Archivos temporales borrados.

REM Actualizando programas
ECHO *ACTUALIZANDO PROGRAMAS*
WINGET UPGRADE --ALL
ECHO Programas actualizados.

REM Analizando integridad de archivos
ECHO *ANALIZANDO INTEGRIDAD DE ARCHIVOS*
SFC /SCANNOW
ECHO Integridad de archivos analizada.

REM Analizando errores de sistema operativo
ECHO *ANALIZANDO ERRORES DE SISTEMA OPERATIVO*
DISM /Online /Cleanup-Image /CheckHealth 
DISM /Online /Cleanup-Image /ScanHealth
ECHO Análisis de errores de sistema operativo completado.

ECHO Todos los procesos han sido completados.

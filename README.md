1. Verificación de permisos de administrador
Propósito: El script revisa si está siendo ejecutado con privilegios de administrador. Esto es necesario porque muchas de las operaciones requieren estos permisos para poder ejecutarse correctamente.
Acción: Si no tienes permisos de administrador, el script se detiene y muestra un mensaje pidiendo que lo ejecutes como tal.
2. Verificación de la versión de Windows
Propósito: Informa al usuario si está utilizando una versión de Windows anterior a Windows 10, ya que algunas funciones del script (como Winget) son recomendadas para Windows 10 o superior.
3. Instalación de Winget (si no está instalado)
Propósito: Si el administrador de paquetes Winget no está instalado en el sistema, el script intentará descargarlo e instalarlo automáticamente.
Acción: Esto permite la instalación y actualización de programas de manera automática.
4. Borrar archivos temporales
Propósito: Elimina los archivos temporales del sistema que ocupan espacio innecesario y pueden afectar el rendimiento.
Acción: Limpia el contenido de la carpeta temporal de Windows (%TEMP%), lo que libera espacio y ayuda a optimizar el sistema.
5. Actualizar programas instalados
Propósito: Utilizando Winget, el script buscará actualizaciones de los programas instalados en el equipo y las instalará.
Acción: Asegura que el software instalado esté al día con las últimas versiones disponibles.
6. Análisis de la integridad de archivos del sistema (SFC)
Propósito: Ejecuta el comando SFC /SCANNOW para verificar y reparar archivos del sistema corruptos o faltantes.
Acción: Si hay problemas con los archivos del sistema, SFC intentará corregirlos automáticamente.
7. Análisis y reparación de la imagen del sistema (DISM)
Propósito: Utiliza las herramientas de mantenimiento DISM para verificar la salud del sistema operativo y corregir posibles errores que puedan estar afectando su funcionamiento.
Acción: DISM /CheckHealth y DISM /ScanHealth revisan si hay problemas con los archivos del sistema y su imagen, sin hacer modificaciones. Si encuentras problemas, puedes correr otros comandos de DISM más profundos para solucionarlos.
8. Restablecer la configuración de red y DNS
Propósito: Restablece la configuración de red y las configuraciones de DNS, lo cual es útil cuando hay problemas de conectividad o configuración de red incorrecta.
Acción: Ejecuta comandos como netsh para resetear la configuración de IP, DNS y el catálogo de Winsock, lo que puede solucionar problemas de red.
9. Mostrar las interfaces de red activas
Propósito: Muestra toda la información de red activa en el sistema, incluyendo adaptadores, IPs, y configuraciones.
Acción: Utiliza el comando ipconfig /all para listar las configuraciones actuales de la red.
10. Liberar y renovar la dirección IP
Propósito: Libera la dirección IP actual asignada al equipo y solicita una nueva del servidor DHCP.
Acción: Ejecuta ipconfig /release seguido de ipconfig /renew, lo cual es útil si tienes problemas de conexión o cambios en la red.
11. Actualizar la configuración de proxy
Propósito: Restablece la configuración del proxy en caso de que se haya configurado uno y esté interfiriendo con la conexión.
Acción: El comando netsh winhttp reset proxy limpia cualquier configuración de proxy en el sistema.
12. Sincronización de la fecha y hora
Propósito: Sincroniza la hora del sistema con un servidor de tiempo en Internet para asegurarse de que la hora y la fecha sean precisas.
Acción: Utiliza el comando w32tm /resync para sincronizar la fecha y hora con los servidores de Microsoft.
13. Verificación de la conectividad a Internet
Propósito: Verifica si el equipo tiene conexión a Internet usando el comando ping.
Acción: Envía un ping a google.com para confirmar que el equipo puede conectarse a Internet correctamente.
14. Finalización del script
Propósito: Informa al usuario que todos los procesos han sido completados y pide que presione una tecla para finalizar.
Acción: Muestra un mensaje final y una pausa para que el usuario vea los resultados antes de que la ventana de comandos se cierre.

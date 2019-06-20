# Seminario
Pagina Principal Proyecto 1 Seminario, consume 2 APIS

Haroldo Pablo Arias Molina - 201020247 

Jorge Daniel Monterroso Nowell - 201504303


Para este container tomamos de base una imagen llamada lead4good/lamp-php la cual trae por defecto instalado php 7.2, apache2 y mysql, sin embargo el mysql no lo utilizamos ya que esta base de datos esta en otro container.

Dentro de la configuración que realizamos en container fue descargar el codigo fuente proviente de esta vía, y vincular las ip internas que genero el docker file para los containers donde tenemos alojadas nuestras APIS 1 de consulta que llena la tabla que esta en esta página y una api de insersión de datos que utilizamos via post.

Dentro de los inconvenientes presentados fueron los siguientes: 

1) El no utilizar correctamente las imagenes que ya vienen configuradas y hacer la configuración desde 0 en un container ubuntu. 

2) El tener las imagenes y no saber como ejecutarlas, el como insertar los documentos de git, y como administrar los puertos, cosas que se solventaron con el comando docker run, que permite adjuntar estas configuraciones.

3) El no poder acceder al container para modificar y/o administrarlo, esto lo solventamos corriendo el container en segundo plano y accediendo desde el bash.

4) El inconveniente de no poder consumir los servicios de los otros container ya que desconociamos de la asignación de IP que realiza el docker, solventando esos inconvenientes 

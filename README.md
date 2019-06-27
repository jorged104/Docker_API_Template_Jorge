# Seminario
Pagina Principal Proyecto 1 Seminario, consume 2 APIS

Haroldo Pablo Arias Molina - 201020247 

Jorge Daniel Monterroso Nowell - 201504303


Dentro de la configuración que realizamos en container fue descargar el codigo fuente proviente de esta vía, y vincular las ip internas que genero el docker file para los containers donde tenemos alojadas nuestras APIS 1 de consulta que llena la tabla que esta en esta página y una api de insersión de datos que utilizamos via post.

Installation
-------------------

 * [Install Docker 1.9+](https://docs.docker.com/installation/) or [askubuntu](http://askubuntu.com/a/473720)
 * Obtener la ultima vercion de la imagen
 
```bash
docker pull jorged104/apache-php
```
Crear la imagen con el dockerfile

```bash
git clone https://github.com/harias25/Seminario.git
cd Seminario
docker build -t="webserver" .
```

Quick Start
-------------------

Correr el contenedor

```bash
docker run -it --net redapp --ip 172.18.0.10 --name webserver -d -p 80:80 webserver
```

Para acceder el contenedor 

```bash
docker exec -it webserver bash
```

Desarrollo/Persistencia
-------------------

Para desarrollar montamos un volumen en  `/var/www/app/`.

```bash
docker run --name webserver -d -p 80:80 \
  -v /host/to/path/app:/var/www/app/ \
  jorged104/apache-php
```

This will make the development.

Conectar con otros Contenedores
-------------------

Conectando con Mysql

```bash
docker network create --subnet=172.18.0.0/16 redapp


docker run -d --net redapp --ip 172.18.0.2 -p 3306:3306 -it --name database -e MYSQL_ROOT_PASSWORD=**** database --character-set-server=utf8mb4 
```

Corriendo la aplicacion:

```bash
docker run -it --net redapp --ip 172.18.0.10 \
 --name webserver -d -p 80:80 webserver
```



ERRORES
-------------------
* El no utilizar correctamente las imagenes que ya vienen configuradas y hacer la configuración desde 0 en un container ubuntu. 

* El tener las imagenes y no saber como ejecutarlas, el como insertar los documentos de git, y como administrar los puertos, cosas que se solventaron con el comando docker run, que permite adjuntar estas configuraciones.

* El no poder acceder al container para modificar y/o administrarlo, esto lo solventamos corriendo el container en segundo plano y accediendo desde el bash.

* El inconveniente de no poder consumir los servicios de los otros container ya que desconociamos de la asignación de IP que realiza el docker, solventando esos inconvenientes 

Sistema
-------------------
 * Ubuntu 16.04
 * PHP  7.0
 * Composer (package manager)

>Environment depends on the version of PHP.

License
-------------------

Apache + PHP docker image is open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)

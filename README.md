# Sistema de Premios

# Introducción

El presente es un sistema de premios y de canje de premios. Para más información
sobre el detalle, debe leerse el [enunciado](enunciado.md).

El repositorio está dividido de la siguiente forma:

- **`/app/`**: Contiene la aplicación del proyecto

- **`/db/`**: Contiene la base de datos del proyecto, así como sus datos.

- **`/doc/`**: Contiene toda la documentación técnica / funcional del proyecto.

- **`/curl/`**: Contiene scripts de `curl` con el que se puede probar la API y de ejemplo

# Instalación / Ejecución

La base de datos y el servidor se pueden ejecutar utilizando `docker-compose` ya que corren dentro de containers.

## Configurando las variables de entorno

Las variables de entorno de este proyecto deben colocarse dentro del archivo `.env`.

Este archivo no existe en el repositorio ya que contiene datos privados que no deberían ser subidos a un repositorio público.

En su defecto se provee un archivo llamado `.env.sample` que contiene un ejemplo con datos de las variables requeridas para la configuración de los servicios.

## Haciendo BUILD de nuestros containers

Una vez creado y configurado el archivo `.env` se puede construir el container haciendo:

``` sh
docker-compose build
```

## Ejecutando lo servicios

El servicio se puede iniciar haciendo:

``` sh
docker-compose up
```

# Generar Datos de Prueba

Una vez que los servicios están corriendo (particularmente la base de datos), ya se pueden generar datos de prueba a efectos de mostrar el TP en clase.

## Generando dos usuarios de prueba

Para generar los usuarios de prueba creé una `rake task` de Rails que me genera dos usuarios `usuario_rico` y `usuario_pobre` con una password llamada `password`.

La rake task se ejecuta de la siguiente manera:

``` sh
bundle exec rake create:sample_users
```

## Reestableciendo el catálogo de productos

Nuevamente, ya efectos del trabajo práctico (ya que no hay interfaz de productos), el catalogo de productos puede reestablecerse corriendo el siguiente comando.

``` sh
bundle exec rake create:sample_catalog
```

**ATENCION**

El catálogo de productos se borra TOTALMENTE.

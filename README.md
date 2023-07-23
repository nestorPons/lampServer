# Configuración del Servidor LAMP

Este repositorio contiene la configuración para alojar un servidor LAMP (Linux, Apache, MySQL, PHP) utilizando Docker Compose. Con esta configuración, podrás ejecutar aplicaciones web PHP y administrar una base de datos MySQL localmente.

## Clonar y Inicializar el Repositorio

Para clonar y ejecutar el servidor LAMP, sigue los siguientes pasos:

1. Asegúrate de tener Docker y Docker Compose instalados en tu sistema.

2. Clona este repositorio ejecutando el siguiente comando en tu terminal:

   ```
   git clone https://github.com/nestorPons/server_lamp.git
   ```

3. Cambia al directorio recién clonado:

   ```
   cd server_lamp
   ```

4. Coloca tu aplicación web PHP en el directorio `php`. Tu aplicación estará disponible en el puerto 80 de tu máquina.

5. Si tienes una base de datos predefinida, colócala en el directorio `dump` con el nombre `myDb.sql`. De lo contrario, la base de datos se creará con las credenciales especificadas en el archivo `docker-compose.yml`.

6. Ajusta los archivos de configuración en el directorio [conf](conf/) según tus necesidades.

7. Ejecuta el siguiente comando para iniciar el servidor Apache y la base de datos MySQL en contenedores Docker:

   ```
   docker-compose up -d
   o 
   sudo docker-compose up -d
   ```

8. Ahora, puedes acceder a tu aplicación web en `http://localhost`, y a PhpMyAdmin en `http://localhost:8080`.

9. La carpeta pública debe estar situada fuera de esta carpeta y debe actualmente esta configurada como `public`
    .
├── public                      ← Carpeta pública
└── server_lamp                 ← Servidor
    ├── Dockerfile
    ├── LICENSE
    ├── README.md
    ├── conf
    │   ├── 000-default.conf
    │   ├── apache2.conf
    │   └── php.ini
    ├── docker-compose.yml
    ├── dump
    │   └── myDb.sql
    └── logs
        ├── access.log
        └── error.log

## Acceso a PhpMyAdmin

- **URL:** http://localhost:8080
- **Usuario:** root

- **Contraseña:** test

Utiliza estos datos de acceso para acceder a PhpMyAdmin y gestionar tu base de datos MySQL.

¡Listo! Ahora tienes un entorno de desarrollo local con Apache, PHP y MySQL listo para alojar y probar tus aplicaciones web. Recuerda detener los servicios con `docker-compose down` cuando hayas terminado para liberar los recursos de tu sistema.

Si tienes alguna pregunta o problema, no dudes en preguntar o abrir un problema en este repositorio.

¡Gracias por utilizar este entorno de desarrollo Dockerizado!```

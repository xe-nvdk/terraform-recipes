Hola, estos archivos son parte de la serie de artículos llamado Terraform Essentials. 

En estos archivos encontrarás la conexión mediate un sock a Docker, pero también puede hacerse mediante por SSH a un servidor remoto. 

En este ejemplo, un poco más complejo que el anterior, voy a desplegar con Terraform, un reverse proxy (Traefik), un WebServer con un Hello World, un Wordpress y un MariaDB con sus variables de entorno.

Este ejemplo, te servirá de manera práctica para tener un wordpress, con su base de datos, ambos, por detrás de un Reverse Proxy con su configuración para que obtenga certificados SSL de Lets Encrypt. También te mostrará como usar una serie de recursos de Terraform, tales volumenes, labels, commandos y variables de entorno.

Si ves que se puede mejorar, hacer un fork y luego hace un Pull Request. También te aconsejo que vayas a mi blog y esten atentos a los artículos. https://www.cduser.com

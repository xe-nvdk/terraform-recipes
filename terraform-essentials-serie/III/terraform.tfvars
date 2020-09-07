#Vamos definir el proveedor. En este caso, el Docker es local, pero para hacerlo hacia a un Docker remoto, deberíamos especificar la conexión SSH hacia nuestro servidor.

local = "unix:///var/run/docker.sock"

#Vamos a especificar con variables el contenedor de mariadb

contenedor_maria = "cduser_mariadb"
imagen_maria = "mariadb:10.5.1"
password-root = "123456"

#Vamos a especificar con variables el contenedor del wordpress

contenedor = "cduser_wordpress"
imagen = "wordpress:php7.4"

#Vamos a especificar las variables de entorno del wordpress con variables de Terraform, pero también vamos a usar estás variables para la config del mariaDB, esto se llama ser eficientes.

mariadb = "cduser_mariadb"
db-user = "user"
password = "pass"
db = "wordpress"
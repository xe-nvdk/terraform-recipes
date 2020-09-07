# Contenedor
resource "docker_container" "mariadb" {
  name  = "cduser_mariadb"
  image = "mariadb:10.5.1"

# Especificamos el volumen a montar de mariadb. Siempre es recomendable que quede persistente en un volumen la carpeta /var/lib/mysql.

  volumes {
    container_path  = "/var/lib/mysql"
    read_only = false
    host_path = "/Users/nacho/terraform/files/mariadb/lib"
  }


# Especificamos variables de entorno para crear una base, generar un usuario root, una contraseña para ese usuario, el usuario de base de datos para wordpress y su contraseña.

  env = ["MYSQL_DATABASE=wordpress", "MYSQL_USER=user", "MYSQL_PASSWORD=pass", "MYSQL_RANDOM_ROOT_PASSWORD=yes"]
  command = ["--default-authentication-plugin=mysql_native_password"]

}

variable "contenedor_maria" {}
variable "imagen_maria" {}
variable "password-root" {}


# Contenedor
resource "docker_container" "mariadb" {
  name  = "${var.contenedor_maria}"
  image = "${var.imagen_maria}"


# Especificamos variables de entorno para crear una base, generar un usuario root, una contraseña para ese usuario, el usuario de base de datos para wordpress y su contraseña.

  env = ["MYSQL_DATABASE=${var.db}", "MYSQL_USER=${var.db-user}", "MYSQL_PASSWORD=${var.password}", "MYSQL_RANDOM_ROOT_PASSWORD=${var.password-root}"]
  command = ["--default-authentication-plugin=mysql_native_password"]

  ports {
    external = 3306
    internal = 3306
  }

}

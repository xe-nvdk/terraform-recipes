variable "contenedor" {}
variable "imagen" {}
variable "mariadb" {}
variable "db-user" {}
variable "password" {}
variable "db" {} 

# Contenedor
resource "docker_container" "recurso" {
  name  = "${var.contenedor}"
  image = "${var.imagen}"
  env = ["WORDPRESS_DB=${var.mariadb}", "WORDPRESS_DB_USER=${var.db-user}", "WORDPRESS_DB_PASSWORD=${var.password}", "WORDPRESS_DB_NAME=${var.db}"]

    ports {
    internal = 80
    external = 80
   }
 }
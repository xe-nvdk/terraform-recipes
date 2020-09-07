# Contenedor
resource "docker_container" "nginx" {
  name  = "nginx"
  image = "nginx:latest"

  ports {
    internal = "80"
    external = "80"
 }
}

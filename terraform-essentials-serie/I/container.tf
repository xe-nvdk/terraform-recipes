# Contenedor
resource "docker_container" "hello_world" {
  name  = "cduser_hello_world"
  image = "tutum/hello-world"

# Especificamos el puerto del contenedor que vamos a exponer

  ports {
    internal = 80
    external = 80
   }
}

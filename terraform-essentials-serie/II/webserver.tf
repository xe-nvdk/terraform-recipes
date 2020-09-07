# Contenedor
resource "docker_container" "hello_world" {
  name  = "cduser_hello_world"
  image = "tutum/hello-world"

# Especificamos las labels para que podamos consumir este contenedor a través de Traefik con la url a.com

  labels {
     label = "traefik.http.routers.hello.rule"
     value = "Host(`a.com`)"
   }

  labels {
     label = "traefik.http.routers.hello.entrypoints"
     value = "websecure"
   }

  labels {
     label = "traefik.http.routers.hello.tls.certresolver"
     value = "leresolver"
   }
}

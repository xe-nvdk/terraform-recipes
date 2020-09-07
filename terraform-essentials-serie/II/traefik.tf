# Contenedor Traefik 
resource "docker_container" "traefik" {
  name  = "cduser_traefik"
  image = "traefik:v2.1.4"
  command = ["--entrypoints.web.address=:80", "--entrypoints.websecure.address=:443", "--providers.docker", "--api", "--api.dashboard=true", "--log.level=ERROR", "--accesslog.filepath=/Users/nacho/terraform/files/traefik/log/access.log", "--accesslog.format=json", "--accesslog.filters.statuscodes=200,300-302", "--accesslog.filters.retryattempts", "--accesslog.filters.minduration=10ms", "--certificatesresolvers.leresolver.acme.httpchallenge=true", "--certificatesresolvers.leresolver.acme.email=nombre@email.com", "--certificatesresolvers.leresolver.acme.storage=/acme.json", "--certificatesresolvers.leresolver.acme.httpchallenge.entrypoint=web"]


# Especificamos los puertos del contenedor que necesita exponer. Traefik necesita si o si el 80 y el 443. 

  ports {
    internal = 80
    external = 80
   }

  ports {
    internal = 443
    external = 443
   }

# Creamos los volumenes para que guarde los certificados y la configuración de Traefik sea constante.

  volumes {
    container_path  = "/var/log"
    read_only = false
    host_path = "/Users/nacho/terraform/files/traefik/log"
  }

  volumes {
    container_path  = "/var/run/docker.sock"
    read_only = true
    host_path = "/var/run/docker.sock"
  }

  volumes {
    container_path  = "/acme.json"
    read_only = true
    host_path = "//Users/nacho/terraform/files/traefik/acme/acme.json"
  }

#commands

# Labels

# Global Redirect to https

  labels {
        label = "traefik.http.routers.http-catchall.rule"
        value = "hostregexp(`{host:.+}`)"
      }

  labels {
        label = "traefik.http.routers.http-catchall.entrypoints"
        value = "web"
     }

  labels {
        label = "traefik.http.routers.http-catchall.middlewares"
        value = "redirect-to-https"
     }

# Making Dashboard Work without https

  labels {
        label = "traefik.enable"
        value = "true"
      }

  labels {
        label = "traefik.http.routers.traefik.rule"
        value = "Host(`dashboard.cduser.com`)" # esto es un registro en mi /etc/hosts
     }

  labels {
        label = "traefik.http.routers.traefik.service"
        value = "api@internal"
     }

  labels {
        label = "traefik.http.routers.traefik.tls.certresolver"
        value = "leresolver"
      }

  labels {
        label = "traefik.http.routers.traefik.entrypoints"
        value = "websecure" # Si quisieramos que el dashboard funcione con https, aquí debemos cambiar 'web' por 'websecure'
     }

  labels {
        label = "traefik.http.routers.traefik.middlewares"
        value = "authtraefik"
     }

  labels {
        label = "traefik.http.middlewares.authtraefik.basicauth.users"
        value = "nacho:{SHA}KfCVPY4DC/T32ix/QdaKZXgYhkg=" # El usuario aquí es nacho y la contraseña es también nacho
     }

# middleware redirect

  labels {
        label = "traefik.http.middlewares.redirect-to-https.redirectscheme.scheme"
        value = "https"
     }
}

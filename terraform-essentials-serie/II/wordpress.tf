# Contenedor
resource "docker_container" "wordpress" {
  name  = "cduser_wordpress"
  image = "wordpress:php7.4"
  env = ["WORDPRESS_DB=cduser_mariadb", "WORDPRESS_DB_USER=user", "WORDPRESS_DB_PASSWORD=pass", "WORDPRESS_DB_NAME=wordpress"]

# Especificamos el volumen a montar de Wordpress. Siempre es recomendable que quede persistente en un volumen la carpeta wp-content.

  volumes {
    container_path  = "/var/www/html/wp-content"
    read_only = false
    host_path = "/Users/nacho/terraform/files/wordpress/wp-content"
  }


# Especificamos las labels para que podamos consumir este contenedor a través de Traefik con la url a.com

  labels {
     label = "traefik.http.routers.wordpress.rule"
     value = "Host(`c.com`)"
   }

  labels {
     label = "traefik.http.routers.wordpress.entrypoints"
     value = "websecure"
   }

  labels {
     label = "traefik.http.routers.wordpress.tls.certresolver"
     value = "leresolver"
   }
}

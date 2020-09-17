# We're copying the docker-compose file to the remote droplet

resource "null_resource" "copy-docker-compose" {

  connection {
    type     = "ssh"
    host     = "digitalocean_droplet.influxdb.ipv4_address"
    user     = "root"
  }

  provisioner "file" {
    source      = "docker-compose.yml"
    destination = "/docker-compose.yml"
  }

}

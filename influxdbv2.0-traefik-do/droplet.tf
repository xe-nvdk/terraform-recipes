# Creamos el droplet

resource "digitalocean_droplet" "influxdb" {
  image     = "ubuntu-20-04-x64"
  name      = "influxdb"
  region    = "nyc1"
  ipv6      = "true"
  private_networking = "false"
  size      = "s-1vcpu-1gb"
  user_data = file("userdata.yaml")
  ssh_keys  = [digitalocean_ssh_key.influxdb.fingerprint]
}

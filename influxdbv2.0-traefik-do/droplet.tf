# Creating the droplet, if you want create in a droplet bigger, refer to this page to get the size variable: https://developers.digitalocean.com/documentation/changelog/api-v2/new-size-slugs-for-droplet-plan-changes/

resource "digitalocean_droplet" "influxdb" {
  image     = "ubuntu-20-04-x64"
  name      = "influxdb"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = "userdata.yaml"
  ssh_keys  = ["${digitalocean_ssh_key.influx.fingerprint}"]
}

# If you not have this domain created in DigitalOcean, Terraform will do for you, but if exist, will drop an error. If you're already have the domain configured in control panel, add the subdomain record manually. 

resource "digitalocean_domain" "your-domain" {
  name = "your-domain.com"
}

# create subdomain for influxdb
resource "digitalocean_record" "influx" {
  domain = "digitalocean_domain.your-domain.name"
  type   = "A"
  name   = "influx"
  ttl    = "35"
  value  = "digitalocean_droplet.influxdb.ipv4_address"
}

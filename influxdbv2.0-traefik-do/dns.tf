# Add a domain name

resource "digitalocean_domain" "default" {
   name = "your-domain" # Change me
}

# Add an A record to the domain for your-domain.com.

resource "digitalocean_record" "influxdb" {
  domain = digitalocean_domain.default.name
  type   = "A"
  name   = "influxdb"
  value  = digitalocean_droplet.influxdb.ipv4_address
}

variable "token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

# Define in your environment file your token. You can get your token from here: https://cloud.digitalocean.com/account/api/tokens

variable "token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = var.token
}

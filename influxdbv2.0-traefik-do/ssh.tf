# Ship our SSH public key to DO

# Create a new SSH key
resource "digitalocean_ssh_key" "influx" {
  name       = "influx"
  public_key = "id_rsa.pub"
}

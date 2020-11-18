#Llevamos nuestra llave a DO

resource "digitalocean_ssh_key" "influxdb" {
  name       = "influxdb"
  public_key = file("id_rsa.pub")
}

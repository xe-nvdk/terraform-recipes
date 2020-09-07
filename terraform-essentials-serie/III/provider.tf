# Configure the Docker provider
variable "local" {}

provider "docker" {
    
    host = "${var.local}"
}
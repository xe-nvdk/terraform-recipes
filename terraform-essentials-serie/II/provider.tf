# Configure the Docker provider
provider "docker" {
    host = "unix:///var/run/docker.sock"
}

# DO provider
terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "2.36.0"
    }
  }
}

# env variable DO token acces key 
variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

# Creating a new Web Droplet in the nyc3 region
resource "digitalocean_droplet" "web-server" {
  image  = "ubuntu-22-04-x64"
  name   = "web-server-1"
  region = "nyc3"
  size   = "s-1vcpu-1gb"
  ssh_keys = ["YOURSSHIDKEYHERE"]
}


# Providing a DigitalOcean Cloud Firewall resource. 
resource "digitalocean_firewall" "web-server-fw" {
  name = "test-fw"

  droplet_ids = [digitalocean_droplet.web-server.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["YOURIPHERE"]
  }

}
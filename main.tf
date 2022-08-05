terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "dop_v1_3aad1c0c14c81a0ae2d92b1629b92e67a443a9e42579a4675ba75f4ee90755cc"
}

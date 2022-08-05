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

resource "digitalocean_kubernetes_cluster" "k8s_iniciativa" {
  name   = "k8s-iniciativa"
  region = "nyc1"
  # Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.23.9-do.0"

  node_pool {
    name       = "default"
    size       = "s-2vcpu-2gb"
    node_count = 2
  }
}

resource "digitalocean_kubernetes_node_pool" "node_adicional" {
  cluster_id = digitalocean_kubernetes_cluster.k8s_iniciativa.id

  name       = "backend-pool"
  size       = "s-2vcpu-2gb"
  node_count = 1
  
}
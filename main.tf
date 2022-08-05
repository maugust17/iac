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
  token = var.do_token
  #"dop_v1_06c98b15ff9a764bf43fbe2a320cd7b74290303d36e10ad965bfaa545326a4e7"
}

resource "digitalocean_kubernetes_cluster" "k8s_iniciativa" {
  name   = var.k8s_name
  #"k8s-iniciativa"
  region = var.region
  #"nyc1"
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

variable "do_token" {
  
}
variable "k8s_name" {
  
}
variable "region" {
  
}
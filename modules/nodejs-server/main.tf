resource "digitalocean_droplet" "node_server" {
  name   = var.droplet_name
  region = var.region
  image  = "docker-18-04"
  size   = var.droplet_size

  monitoring = true
  ssh_keys   = var.ssh_keys
}

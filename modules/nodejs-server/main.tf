resource "digitalocean_droplet" "node_server" {
  name   = var.droplet_name
  region = var.region
  image  = var.image
  size   = var.droplet_size

  monitoring = true
  ssh_keys   = var.ssh_keys
}

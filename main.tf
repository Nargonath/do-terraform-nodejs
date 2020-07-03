terraform {
  required_version = "= 0.12.28"
  required_providers {
    digitalocean = "~> 1.19"
  }
}

provider "digitalocean" {
  token   = var.do_token
  version = "~> 1.19"
}

resource "digitalocean_ssh_key" "default" {
  for_each = var.users_ssh_keys

  name       = "SSH key for ${each.key}"
  public_key = each.value
}

resource "digitalocean_project" "do_terraform_nodejs" {
  name        = "do_terraform_nodejs"
  description = "project to test fully automated digitalocean nodejs droplet setup"
  purpose     = "server"
  environment = "Production"

  resources = [module.nodejs_server.urn]
}

data "digitalocean_droplet_snapshot" "docker_snapshot" {
  name_regex  = "^packer-docker"
  region      = var.do_region
  most_recent = true
}

module "nodejs_server" {
  source = "./modules/nodejs-server"

  droplet_name = "test-terraform-nodejs-server"
  image        = data.digitalocean_droplet_snapshot.docker_snapshot.id
  region       = var.do_region
  droplet_size = "s-1vcpu-1gb"

  ssh_keys = [
    for key, value in var.users_ssh_keys :
    digitalocean_ssh_key.default[key].id
  ]
}

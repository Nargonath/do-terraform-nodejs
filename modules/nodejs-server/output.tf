output "urn" {
  description = "The Uniform Resource Name of the NodeJS droplet"
  value       = digitalocean_droplet.node_server.urn
}

output "ipv4" {
  description = "The droplet IP v4"
  value       = digitalocean_droplet.node_server.ipv4_address
}

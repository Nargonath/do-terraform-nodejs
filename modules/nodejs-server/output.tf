output "urn" {
  description = "The Uniform Resource Name of the NodeJS droplet"
  value       = digitalocean_droplet.node_server.urn
}

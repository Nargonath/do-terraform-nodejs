variable "droplet_name" {
  type        = string
  description = "Name of the droplet for the NodeJS server"
}

variable "region" {
  type        = string
  description = "Region where the elements needed will be taken from"
}

variable "droplet_size" {
  type        = string
  description = "Size of the NodeJS server droplet"
}

variable "ssh_keys" {
  type        = list(string)
  description = "List of SSH keys fingerprints to add to the droplet"
}

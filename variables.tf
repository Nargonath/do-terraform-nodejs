variable "do_token" {
  type = string
}

variable "do_region" {
  type    = string
  default = "fra1"
}

# this variable should be passed through a variable files (.tfvars)
variable "users_ssh_keys" {
  type = map(string)
}

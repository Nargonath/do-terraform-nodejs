<div align="center">
  <h1>DigitalOcean Terraform NodeJS server</h1>
  <strong>This repo is an attempt for setting up a fully configured DigitalOcean infrastructure for a NodeJS server with a database hosted on a different droplet within a VPC and a frontend</strong>
</div>

<hr>

# Setup

This terraform configuration requires multiples variables files for which you can find examples in the repository:

- `secrets.tfvars`
- `ssh_keys.tfvars`

You need to copy-paste the examples, remove the `.example` in the name of the file and fill them up with your real data.

# Create the infrastructure

You can create the infrastructure with `terraform apply -var-file="secrets.tfvars" -var-file="ssh_keys.tfvars"`

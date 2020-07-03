<div align="center">
  <h1>DigitalOcean Terraform NodeJS server</h1>
  <strong>This repo is an attempt for setting up a fully configured DigitalOcean infrastructure for a NodeJS server with a database hosted on a different droplet within a VPC and a frontend</strong>
</div>

<hr>

# Setup

## Custom Droplet image

This project uses [Packer](https://www.packer.io/) from Hashicorp to create custom droplet images with everything setup.

The Packer configuration uses a variable file for its secrets: `packer-secrets.json`. You'll find an example file in this repo for the structure to follow.

### Build your snapshot

To build your snapshot using Packer:

```bash
packer build \
  -var 'size=s-1vcpu-1gb' \
  -var-file 'packer-secrets.json' \
  packer.json
```

## Infrastructure configuration

This terraform configuration requires multiples variables files for which you can find examples in the repository:

- `secrets.tfvars`
- `ssh_keys.tfvars`

You need to copy-paste the examples, remove the `.example` in the name of the file and fill them up with your real data.

# Create the infrastructure

You can create the infrastructure with `terraform apply -var-file="secrets.tfvars" -var-file="ssh_keys.tfvars"`

# Resources

This article gives guidelines to improve terraform usage: https://cloudskiff.com/terraform-code-quality/?utm_source=Slack&utm_medium=TerraformCodeQuality.

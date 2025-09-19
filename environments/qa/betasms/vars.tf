### Variables
variable "ssh_key_name"   { type = string }
variable "ssh_public_key" { type = string }

# ECR
variable "backend_secrets_manager_arn" { type = string }


### Locals
locals {
}

# vim:filetype=terraform ts=2 sw=2 et:


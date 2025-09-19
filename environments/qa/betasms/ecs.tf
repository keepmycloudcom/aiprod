### Get secrets from AWS Secrets store 
data "aws_secretsmanager_secret" "vsphere-secrets" {
  arn = "arn:aws:secretsmanager:eu-central-1:384558264348:secret:mgmt/vsphere/office-configuration-V8IJg3"
}

data "aws_secretsmanager_secret_version" "vsphere-current" {
  secret_id = data.aws_secretsmanager_secret.vsphere-secrets.id
}

locals {
  vsphere_conf = [jsondecode(data.aws_secretsmanager_secret_version.vsphere-current.secret_string)]
}

### ECS Cluster
module "ecs" {
  source             = "git::https://github.com/keepmycloudcom/modules-ecs.git//cluster?ref=v1.0.0"
  name               = local.basename
  capacity_providers = ["EXTERNAL"]

  tags = local.base_tags
}

module "ecs-container-instance" {
  source = "git::https://github.com/keepmycloudcom/modules-ecs.git//container-instance?ref=v1.0.0"

  # vSphere configuration
  vsphere_conf = local.vsphere_conf

  # Virtual Machine configuration
  name           = "${local.basename}-cluster"
  cpu            = 32
  memory         = 64000
  data_disk_size = 60
  ssh_key        = var.ssh_public_key
  consul_domain  = "${var.project_env}.${var.consul_domain}"
  vpc_cidr       = var.vpc_cidr
  #tags = local.base_tags
}

data "aws_route53_zone" "main" {
  name         = "${var.project_domain}"
  private_zone = false
}

output "instance_ip_addr" {
  value       = module.ecs-container-instance.vm_ip
  description = "The private IP address of the main server instance."
}

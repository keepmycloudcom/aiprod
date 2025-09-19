module "task-scylla-db-0" {
  source                    = "git::https://github.com/keepmycloudcom/modules-ecs.git//task?ref=v1.0.0"
  aws_region                = var.aws_region
  project_env               = var.project_env
  cloudwatch_log_group_name = "/${var.project_env}/${var.project_name}/scylla-db"
  basename                  = local.basename
  name                      = "scylla-db-0"
  task_container_image      = "scylladb/scylla:6.1.1"
  container_name            = "scylla-db-0"
  task_definition_cpu       = 3000
  task_definition_memory    = 14000 
  privileged                = true
  task_container_command    = ["--options-file", "/etc/scylla/scylla.yaml", "--seed-provider-parameters", "seeds=scylla-9042.service.dc1.${var.project_env}.${var.consul_domain}", "--smp", "3", "--memory", "14G", "--developer-mode", "0", "--overprovisioned", "1", "--write-request-timeout-in-ms", "20000"]
  docker_labels = {
    "SERVICE_NAME" = "scylla"
  }
  volume = {
    scylla-db-0 = {
      name = "scylla-db-0"
      docker_volume_configuration = [{
        scope         = "shared"
        autoprovision = true
        driver        = "local"
      }]
    }
  }
  task_mount_points = [{
    containerPath = "/var/lib/scylla"
    readOnly      = false
    sourceVolume  = "scylla-db-0"
  }]
  network_mode = "bridge"

  tags = local.base_tags
}

# Service
module "service-scylla-db-0" {
  source      = "git::https://github.com/keepmycloudcom/modules-ecs.git//service?ref=v1.0.0"
  aws_region  = var.aws_region
  project_env = var.project_env

  name                = "scylla-db-0"
  ecs_cluster         = module.ecs.id
  container_name      = "scylla-db-0"
  scheduling_strategy = "DAEMON"

  ecs_task_definition = module.task-scylla-db-0.arn

  tags = local.base_tags
}

module "task-scylla-db-1" {
  source                    = "git::https://github.com/keepmycloudcom/modules-ecs.git//task?ref=v1.0.0"
  aws_region                = var.aws_region
  project_env               = var.project_env
  cloudwatch_log_group_name = "/${var.project_env}/${var.project_name}/scylla-db"
  basename                  = local.basename
  name                      = "scylla-db-1"
  task_container_image      = "scylladb/scylla:6.1.1"
  container_name            = "scylla-db-1"
  task_definition_cpu       = 3000
  task_definition_memory    = 14000
  privileged                = true
  task_container_command    = ["--options-file", "/etc/scylla/scylla.yaml", "--seed-provider-parameters", "seeds=scylla-9042.service.dc1.${var.project_env}.${var.consul_domain}", "--smp", "3", "--memory", "14G", "--developer-mode", "0", "--overprovisioned", "1", "--write-request-timeout-in-ms", "20000"]
  docker_labels = {
    "SERVICE_NAME" = "scylla"
  }
  volume = {
    scylla-db-1 = {
      name = "scylla-db-1"
      docker_volume_configuration = [{
        scope         = "shared"
        autoprovision = true
        driver        = "local"
      }]
    }
  }
  task_mount_points = [{
    containerPath = "/var/lib/scylla"
    readOnly      = false
    sourceVolume  = "scylla-db-1"
  }]
  network_mode = "bridge"

  tags = local.base_tags
}

# Service
module "service-scylla-db-1" {
  source      = "git::https://github.com/keepmycloudcom/modules-ecs.git//service?ref=v1.0.0"
  aws_region  = var.aws_region
  project_env = var.project_env

  name                = "scylla-db-1"
  ecs_cluster         = module.ecs.id
  container_name      = "scylla-db-1"
  scheduling_strategy = "DAEMON"

  ecs_task_definition = module.task-scylla-db-1.arn

  tags = local.base_tags
}

module "task-scylla-db-2" {
  source                    = "git::https://github.com/keepmycloudcom/modules-ecs.git//task?ref=v1.0.0"
  aws_region                = var.aws_region
  project_env               = var.project_env
  cloudwatch_log_group_name = "/${var.project_env}/${var.project_name}/scylla-db"
  basename                  = local.basename
  name                      = "scylla-db-2"
  task_container_image      = "scylladb/scylla:6.1.1"
  container_name            = "scylla-db-2"
  task_definition_cpu       = 3000
  task_definition_memory    = 14000
  privileged                = true
  task_container_command    = ["--options-file", "/etc/scylla/scylla.yaml", "--seed-provider-parameters", "seeds=scylla-9042.service.dc1.${var.project_env}.${var.consul_domain}", "--smp", "3", "--memory", "14G", "--developer-mode", "0", "--overprovisioned", "1", "--write-request-timeout-in-ms", "20000"]
  docker_labels = {
    "SERVICE_NAME" = "scylla"
  }
  volume = {
    scylla-db-2 = {
      name = "scylla-db-2"
      docker_volume_configuration = [{
        scope         = "shared"
        autoprovision = true
        driver        = "local"
      }]
    }
  }
  task_mount_points = [{
    containerPath = "/var/lib/scylla"
    readOnly      = false
    sourceVolume  = "scylla-db-2"
  }]
  network_mode = "bridge"
  tags         = local.base_tags
}

# Service
module "service-scylla-db-2" {
  source      = "git::https://github.com/keepmycloudcom/modules-ecs.git//service?ref=v1.0.0"
  aws_region  = var.aws_region
  project_env = var.project_env

  name                = "scylla-db-2"
  ecs_cluster         = module.ecs.id
  container_name      = "scylla-db-2"
  scheduling_strategy = "DAEMON"

  ecs_task_definition = module.task-scylla-db-2.arn

  tags = local.base_tags
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "scylla-db-loggroup" {
  name              = "/${var.project_env}/${var.project_name}/scylla-db"
  retention_in_days = "3"
  tags = merge(local.base_tags, {
    Name = "/${var.project_env}/${var.project_name}/scylla-db"
  })
}

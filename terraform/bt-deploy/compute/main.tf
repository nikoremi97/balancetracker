terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.11"
    }
  }
}

provider "aws" {
  region = var.region

  # use the assume_role to limit the actions of terraform
  # assume_role {
  #   role_arn = "terraform_role_arn"
  # }
}

locals {
  tags = {
    service = "compute"
    product = "balancetracker"
  }
}

module "ecr" {
  source = "./ecr"
  tags   = local.tags
}

module "ecs" {
  source                        = "./ecs"
  tags                          = local.tags
  cluster_name                  = var.cluster_name
  container_name                = var.container_name
  task_definition_name          = var.task_definition_name
  task_role                     = module.iam.roles.task_role
  ecs_exec_role                 = module.iam.roles.ecs_exec_role
  balancetracker_repository_url = module.ecr.balancetracker_repository.repository_url
}

module "ec2" {
  source             = "./ec2"
  tags               = local.tags
  cluster_name       = var.cluster_name
  instance_type_spot = var.instance_type_spot
  ec2_instance_role  = module.iam.roles.ec2_instance
}

module "iam" {
  source             = "./iam"
  tags               = local.tags
  ecs_execution_role = var.ecs_execution_role
  ecs_task_role      = var.ecs_task_role
  ec2_instance_role  = var.ec2_instance_role
}
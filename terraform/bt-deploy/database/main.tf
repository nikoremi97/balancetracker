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

module "rds" {
  source              = "./rds"
  identifier          = var.identifier
  db_name             = var.db_name
  instance_class      = var.instance_class
  port                = var.port
  backup_window       = var.backup_window
  engine_version      = var.engine_version
  maintenance_window  = var.maintenance_window
  monitoring_role_arn = var.monitoring_role_arn
  network_type        = var.network_type
  storage_type        = var.storage_type
}
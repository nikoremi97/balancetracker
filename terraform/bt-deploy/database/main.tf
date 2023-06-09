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

module "aurora" {
  source                  = "./rds"
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  database_name           = var.database_name
  master_username         = var.master_username
  master_password         = var.master_password
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  apply_immediately       = var.apply_immediately
  vpc_security_group_ids  = var.vpc_security_group_ids
}
resource "aws_rds_cluster" "aurora" {
  cluster_identifier      = var.cluster_identifier
  engine                  = var.engine
  engine_version          = var.engine_version
  availability_zones      = var.availability_zones
  storage_type            = var.storage_type
  database_name           = var.database_name
  port                    = var.port
  master_username         = var.master_username
  master_password         = var.master_password
  storage_encrypted       = true
  backup_retention_period = var.backup_retention_period
  preferred_backup_window = var.preferred_backup_window
  apply_immediately       = var.apply_immediately
  vpc_security_group_ids  = var.vpc_security_group_ids
  network_type            = "IPV4"
  skip_final_snapshot     = true
}
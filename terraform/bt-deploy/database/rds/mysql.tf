resource "aws_db_instance" "mysql" {
  identifier                = var.identifier
  db_name                   = var.db_name
  instance_class            = var.instance_class
  port                      = var.port
  backup_window             = var.backup_window
  engine_version            = var.engine_version
  maintenance_window        = var.maintenance_window
  monitoring_role_arn       = var.monitoring_role_arn
  network_type              = var.network_type
  storage_type              = var.storage_type
  monitoring_interval       = 60
  max_allocated_storage     = 1000
  backup_retention_period   = 7
  apply_immediately         = false
  copy_tags_to_snapshot     = true
  customer_owned_ip_enabled = false
  deletion_protection       = false
  multi_az                  = false
  publicly_accessible       = true
  storage_encrypted         = true
}
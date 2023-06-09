resource "aws_ecs_cluster" "balancetracker" {
  name     = var.cluster_name
  tags_all = var.tags
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}
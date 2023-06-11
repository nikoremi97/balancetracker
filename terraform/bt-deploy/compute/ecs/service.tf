resource "aws_ecs_service" "ecs_service" {
  depends_on = [aws_ecs_cluster.balancetracker, aws_ecs_task_definition.task_definition]

  name                  = var.service_name
  cluster               = aws_ecs_cluster.balancetracker.id
  task_definition       = "balancetracker-deployment"
  desired_count         = 1
  wait_for_steady_state = false

  ordered_placement_strategy {
    field = "attribute:ecs.availability-zone"
    type  = "spread"
  }

  ordered_placement_strategy {
    field = "instanceId"
    type  = "spread"
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  load_balancer {
    container_name   = "balancetracker-container"
    container_port   = 5000
    target_group_arn = var.target_group
  }

}
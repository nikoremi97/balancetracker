resource "aws_cloudwatch_log_group" "task_definition" {
  name = "/ecs/${var.task_definition_name}"

  tags = merge(var.tags, { Name = "${var.task_definition_name}-cloudwatch-log-group" })

  retention_in_days = 14
}

resource "aws_ecs_task_definition" "task_definition" {
  family = var.task_definition_name
  container_definitions = jsonencode([
    {
      name  = var.container_name
      image = var.balancetracker_repository_url
      portMappings = [
        {
          hostPort      = 0
          containerPort = 5000
          protocol      = "tcp"
        }
      ]
      environment = []
      essential   = true
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.task_definition.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "ecs"
          "awslogs-region"        = "us-east-1"
        }
      }
    }
  ])

  requires_compatibilities = ["EC2"]
  task_role_arn            = var.task_role
  execution_role_arn       = var.ecs_exec_role
  cpu                      = 1024
  memory                   = 256
  tags                     = merge(var.tags, { Name = "${var.task_definition_name}-task-definition" })
}
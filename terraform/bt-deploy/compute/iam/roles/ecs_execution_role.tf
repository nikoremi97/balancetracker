resource "aws_iam_role" "ecs_exec_role" {

  name               = var.ecs_execution_role
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": {
    "Effect": "Allow",
    "Principal": {
      "Service": "ecs-tasks.amazonaws.com"
    },
    "Action": "sts:AssumeRole"
  }
}
EOF

  force_detach_policies = true
  tags                  = merge(var.tags, { Name = "${var.ecs_execution_role}-role" })
}

resource "aws_iam_role_policy_attachment" "ecs_exec_role_policy_attachment" {
  role       = aws_iam_role.ecs_exec_role.name
  policy_arn = module.policies.run_ecs_taks
}

output "ecs_exec_role" {
  value = aws_iam_role.ecs_exec_role.arn
}
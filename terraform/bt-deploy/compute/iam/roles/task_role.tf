resource "aws_iam_role" "task_role" {

  name               = var.ecs_task_role
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
  tags                  = merge(var.tags, { Name = "${var.ecs_task_role}-role" })
}

resource "aws_iam_role_policy_attachment" "task_role_policy_attachment" {
  role       = aws_iam_role.task_role.name
  policy_arn = module.policies.task_policy
}

output "task_role" {
  value = aws_iam_role.task_role.arn
}
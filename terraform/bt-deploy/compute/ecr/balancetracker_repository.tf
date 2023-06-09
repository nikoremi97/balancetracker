resource "aws_ecr_repository" "balancetracker_service" {
  name = "balancetracker-service"

  tags = var.tags
}

resource "aws_ecr_lifecycle_policy" "policy_balancetracker_service" {
  repository = aws_ecr_repository.balancetracker_service.name

  policy = <<EOF
{
    "rules": [
        {
            "rulePriority": 1,
            "description": "Keep only 5 untagged images, expire all others",
            "selection": {
                "tagStatus": "untagged",
                "countType": "imageCountMoreThan",
                "countNumber": 5
            },
            "action": {
                "type": "expire"
            }
        }
    ]
}
EOF
}

output "balancetracker_repository" {
  value = aws_ecr_repository.balancetracker_service
}

variable "tags" {
  type = map(string)
}
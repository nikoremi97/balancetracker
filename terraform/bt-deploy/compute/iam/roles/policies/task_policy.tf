resource "aws_iam_policy" "task_policy" {
  name = "task-policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "rds:ListTagsForResource",
          "rds:DescribeDBInstances",
          "rds:DescribeDBClusters"
        ]
        Effect   = "Allow"
        Resource = "arn:aws:rds:us-east-1:487359670077:cluster:balancetracker-clients"
      },
      {
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action = [
          "secretsmanager:GetSecretValue",
        ]
        Effect   = "Allow"
        Resource = "arn:aws:secretsmanager:*:487359670077:secret:balancetracker_db_secret*"
      },
      {
        Action = [
          "secretsmanager:ListSecrets",
          "kms:Decrypt"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  })
}

output "task_policy" {
  value = aws_iam_policy.task_policy.arn
}

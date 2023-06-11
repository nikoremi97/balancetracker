resource "aws_sns_topic" "cloudwatch_alarms" {
  name = "CloudWatch-Alarms-Topic"
  tags = var.tags
}
resource "aws_lb_target_group" "target" {
  name     = "balancetracker-target-group"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = "vpc-013566d941b56f6fb"
}

output "target_group" {
  value = aws_lb_target_group.target.id
}
resource "aws_lb" "load_balancer" {
  name               = "balancetracker-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-0e8390755351d7dd8"]
  subnets            = ["subnet-072218ab2eb25fcef", "subnet-0896255c42a9be24a"]

  tags = var.tags
}

output "load_balancer" {
  value = aws_lb.load_balancer.id
}
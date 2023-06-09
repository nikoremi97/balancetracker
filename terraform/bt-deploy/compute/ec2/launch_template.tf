data "aws_ami" "ecs" {
  most_recent = true

  filter {
    name = "name"
    values = [
    "amzn2-ami-ecs-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

  owners = [
    "amazon" # Only official images
  ]
}

resource "aws_launch_template" "ecs_config_launch_config_spot" {
  name_prefix   = "${var.cluster_name}_ecs_cluster_spot"
  image_id      = data.aws_ami.ecs.id
  instance_type = var.instance_type_spot # e.g. t2.micro
  tags          = var.tags
  # spot_price    = var.spot_bid_price

  user_data = base64encode(<<EOF
        #!/bin/bash
        echo ECS_CLUSTER=${var.cluster_name} >> /etc/ecs/ecs.config
        echo ECS_INSTANCE_ATTRIBUTES={\"purchase-option\":\"spot\"} >> /etc/ecs/ecs.config
    EOF
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = ["sg-0e8390755351d7dd8"]
  }


  iam_instance_profile {
    arn = var.ec2_instance_role
  }

  lifecycle {
    create_before_destroy = true
  }
}

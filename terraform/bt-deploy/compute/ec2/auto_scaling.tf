resource "aws_autoscaling_group" "ecs_cluster_spot" {
  name_prefix = "${var.cluster_name}_asg_spot"
  termination_policies = [
    "OldestInstance" # When a “scale down” event occurs, which instances to kill first
  ]

  max_size         = var.max_spot_instances
  min_size         = var.min_spot_instances
  desired_capacity = var.desired_capacity
  force_delete     = true

  # Use this launch template to define “how” the EC2 instances are to be launched
  launch_template {
    id      = aws_launch_template.ecs_config_launch_config_spot.id
    version = "$Latest"
  }

  vpc_zone_identifier = ["subnet-0896255c42a9be24a", "subnet-072218ab2eb25fcef"]

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      desired_capacity
    ]
  }
}


module "roles" {
  source             = "./roles"
  tags               = var.tags
  ecs_execution_role = var.ecs_execution_role
  ecs_task_role      = var.ecs_task_role
  ec2_instance_role  = var.ec2_instance_role
}

output "roles" {
  value = module.roles
}
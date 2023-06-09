variable "tags" {
  type = map(string)
}

variable "ecs_execution_role" {
  type = string
}

variable "ecs_task_role" {
  type = string
}

variable "ec2_instance_role" {
  type = string
}
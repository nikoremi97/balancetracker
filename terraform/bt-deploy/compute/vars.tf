variable "region" {
  type    = string
  default = ""
}

variable "ecs_execution_role" {
  type    = string
  default = ""
}

variable "ecs_task_role" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "task_definition_name" {
  type    = string
  default = ""
}

variable "container_name" {
  type    = string
  default = ""
}

variable "ec2_instance_role" {
  type    = string
  default = ""
}

variable "instance_type_spot" {
  type    = string
  default = ""
}

variable "service_name" {
  type    = string
  default = ""
}

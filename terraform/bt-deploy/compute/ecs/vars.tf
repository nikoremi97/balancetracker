variable "cluster_name" {
  type = string
}

variable "task_definition_name" {
  type = string
}

variable "region" {
  type    = string
  default = ""
}

variable "container_name" {
  type    = string
  default = ""
}

variable "ecs_exec_role" {
  type    = string
  default = ""
}

variable "task_role" {
  type    = string
  default = ""
}

variable "balancetracker_repository_url" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}

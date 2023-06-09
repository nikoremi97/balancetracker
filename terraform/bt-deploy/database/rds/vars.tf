variable "cluster_identifier" {
  type    = string
  default = ""
}

variable "engine" {
  type    = string
  default = ""
}

variable "engine_version" {
  type    = string
  default = ""
}

variable "availability_zones" {
  type    = list(string)
  default = []
}

variable "vpc_security_group_ids" {
  type    = list(string)
  default = []
}

variable "database_name" {
  type    = string
  default = ""
}

variable "port" {
  type    = number
  default = 3306
}

variable "master_username" {
  type    = string
  default = ""
}

variable "master_password" {
  type    = string
  default = ""
}

variable "backup_retention_period" {
  type    = string
  default = ""
}

variable "preferred_backup_window" {
  type    = string
  default = ""
}

variable "storage_type" {
  type    = string
  default = ""
}

variable "apply_immediately" {
  type    = bool
  default = false
}

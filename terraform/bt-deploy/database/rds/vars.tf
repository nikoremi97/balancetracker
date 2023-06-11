variable "identifier" {
  type = string
}

variable "db_name" {
  type = string
}

variable "instance_class" {
  type = string
}

variable "port" {
  type = number
}

variable "backup_window" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "maintenance_window" {
  type = string
}

variable "monitoring_role_arn" {
  type = string
}

variable "network_type" {
  type = string
}

variable "storage_type" {
  type = string

}
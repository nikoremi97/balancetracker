variable "instance_type_spot" {
  default = "t2.micro"
}

variable "spot_bid_price" {
  default     = "0.08"
  description = "How much you are willing to pay as an hourly rate for an EC2 instance, in USD"
}

variable "min_spot_instances" {
  default = "1"
}

variable "max_spot_instances" {
  default = "2"
}

variable "desired_capacity" {
  default = "1"
}

variable "ec2_instance_role" {
  type    = string
  default = ""
}

variable "cluster_name" {
  type    = string
  default = ""
}

variable "tags" {
  type = map(string)
}

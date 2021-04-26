variable "aws_account_id" {
  type = string
}

variable "aws_region" {
  type = string
}

variable "app_name" {
  type    = string
  default = "appname"
}
variable "vpc_cidr" {
  type = string
}

variable "az_count" {
  type    = number
  default = 2
}

variable "private_subnet" {
  type    = list(string)
  default = ["private_subnet_ecs", "private_subnet_db"]
}

variable "public_subnet" {
  type    = list(string)
  default = ["public_subnet_common", "public_subnet_backend"]
}

variable "app_type" {
  type    = list(string)
  default = ["ecs", "db"]
}

variable "app_port" {
  type    = number
  default = 80

}

variable "health_check_path" {
  type    = string
  default = "/"

}

variable "bastion_ami" {
  type = map
}

variable "bastion_ebs_optimized" {
  default     = false
  type        = bool
  description = "If true, the bastion instance will be EBS-optimized"
}

variable "bastion_instance_type" {
  default     = "t2.micro"
  type        = string
  description = "Instance type for bastion instance"
}

variable "key_name" {
  type = string
}

variable "db_instance_ami" {
  type = map
}

variable "db_instance_type" {
  type = map

}


variable "db_instance_country" {
  type = list(string)
}

variable "ecs_cluster_country" {
  type = list(string)
}
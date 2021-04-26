#Fetching availability zones in the region
data "aws_availability_zones" "available" {
}

#Create VPC 
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name      = "vpc_${var.app_name}_${terraform.workspace}"
    Terraform = true

  }
}
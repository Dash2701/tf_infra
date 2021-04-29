#Fetching availability zones in the region
data "aws_availability_zones" "available" {
}

#Create VPC 
resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name      = "${var.app_name}-vpc-${terraform.workspace}"
    Terraform = true

  }

}



#create  private subnets 
resource "aws_subnet" "private_subnet" {
  count             = var.az_count
  cidr_block        = cidrsubnet(aws_vpc.main_vpc.cidr_block, 8, count.index)
  availability_zone = data.aws_availability_zones.available.names[count.index]
  vpc_id            = aws_vpc.main_vpc.id
  tags = {
    Name      = "${var.app_name}-${var.private_subnet[count.index]}-${terraform.workspace}"
    Terraform = true
  }
}

resource "aws_subnet" "public_subnet" {
  count                   = var.az_count
  cidr_block              = cidrsubnet(aws_vpc.main_vpc.cidr_block, 8, var.az_count + count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.main_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name      = "${var.app_name}-${var.public_subnet[count.index]}-${terraform.workspace}"
    Terraform = true
  }
}
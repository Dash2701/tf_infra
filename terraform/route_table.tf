resource "aws_route_table" "private_route_table" {
  count  = var.az_count
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.ngw.*.id, count.index)
  }

  tags = {
    Name      = "private_route_${var.app_name}_${var.app_type[count.index]}_${terraform.workspace}"
    Terraform = true
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name      = "public_route_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }
}
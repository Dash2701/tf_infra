resource "aws_route_table" "private_route_table" {
  count  = var.az_count
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = element(aws_nat_gateway.ngw.*.id, count.index)
  }

  tags = {
    Name      = "${var.app_name}-privateroute-${var.app_type[count.index]}-${terraform.workspace}"
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
    Name      = "${var.app_name}-publicroute-${terraform.workspace}"
    Terraform = true
  }
}
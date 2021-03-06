
# Create a new route table for the private subnets, make it route non-local traffic through the NAT gateway to the internet
resource "aws_eip" "gweip" {
  count      = var.az_count
  vpc        = true
  depends_on = [aws_internet_gateway.igw]
  tags = {
    Name      = "${var.app_name}-eip-${var.app_type[count.index]}-${terraform.workspace}"
    Terraform = true
  }
}


resource "aws_nat_gateway" "ngw" {
  count         = var.az_count
  subnet_id     = element(aws_subnet.public_subnet.*.id, count.index)
  allocation_id = element(aws_eip.gweip.*.id, count.index)
  tags = {
    Name      = "${var.app_name}-natgw-${var.app_type[count.index]}-${terraform.workspace}"
    Terraform = true
  }
}

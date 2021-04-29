resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  tags = {
    Name      = "${var.app_name}-vpc-s3-endpoint-${terraform.workspace}"
    Terraform = true
  }

}
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.main_vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  tags = {
    Name      = "vpc_s3_endpoint_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }

}
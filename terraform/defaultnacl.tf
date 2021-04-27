resource "aws_default_network_acl" "default" {
  default_network_acl_id = aws_vpc.main_vpc.default_network_acl_id

  tags = {
    Name = "${var.app_name}-default-nacl-${terraform.workspace}"
  }
}
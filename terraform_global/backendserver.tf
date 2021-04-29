
resource "aws_instance" "backend_instance" {
  count                  = length(var.backend_instance_country)
  ami                    = var.backend_instance_ami[var.backend_instance_country[count.index]]
  instance_type          = var.backend_instance_type[var.backend_instance_country[count.index]]
  subnet_id              = element(aws_subnet.private_subnet.*.id, 0)
  vpc_security_group_ids = aws_security_group.app_sg.*.id
  key_name               = var.key_name
  tags = {
    Name = "${var.app_name}-${var.backend_instance_country[count.index]}-backend-${terraform.workspace}"
  }

  depends_on = [
    aws_subnet.private_subnet, aws_security_group.app_sg
  ]
}
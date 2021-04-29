
resource "aws_instance" "db_instance" {
  count                  = length(var.db_instance_country)
  ami                    = var.db_instance_ami[var.db_instance_country[count.index]]
  instance_type          = var.db_instance_type[var.db_instance_country[count.index]]
  subnet_id              = element(aws_subnet.private_subnet.*.id, 1)
  vpc_security_group_ids = aws_security_group.db_sg.*.id
  key_name               = var.key_name
  tags = {
    Name = "${var.app_name}-${var.db_instance_country[count.index]}-db-${terraform.workspace}"
  }
}
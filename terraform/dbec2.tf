
resource "aws_security_group" "db_sg" {
  vpc_id = aws_vpc.main_vpc.id
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name      = "DB_SG_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }
}



resource "aws_instance" "db_instance" {
  count                  = length(var.db_instance_country)
  ami                    = var.db_instance_ami[var.db_instance_country[count.index]]
  instance_type          = var.db_instance_type[var.db_instance_country[count.index]]
  subnet_id              = element(aws_subnet.private_subnet.*.id, 1)
  vpc_security_group_ids = aws_security_group.db_sg.*.id
  key_name               = var.key_name
  tags = {
    Name = "DB_Server_${var.db_instance_country[count.index]}_${terraform.workspace}"
  }
}
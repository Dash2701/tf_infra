resource "aws_security_group" "bastion" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name      = "sg_bastion_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }
}



resource "aws_instance" "bastion" {
  ami                         = var.bastion_ami.unix
  availability_zone           = data.aws_availability_zones.available.names[0]
  ebs_optimized               = var.bastion_ebs_optimized
  instance_type               = var.bastion_instance_type
  key_name                    = var.key_name
  subnet_id                   = element(aws_subnet.public_subnet.*.id, 0)
  associate_public_ip_address = true

  tags = {
    Name      = "bastien_host_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }

}

resource "aws_network_interface_sg_attachment" "bastion" {
  security_group_id    = aws_security_group.bastion.id
  network_interface_id = aws_instance.bastion.primary_network_interface_id
}
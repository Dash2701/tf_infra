data "aws_subnet_ids" "privatesubnet" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${var.app_name}-${var.private_subnet[1]}-${terraform.workspace}"
  }
}

output "demo" {
  value = data.aws_subnet_ids.privatesubnet

}


resource "aws_network_acl" "dmz" {
  vpc_id     = aws_vpc.main_vpc.id
  subnet_ids = data.aws_subnet_ids.privatesubnet.ids
  tags = {
    Name = "nacl-${var.app_name}-${terraform.workspace}"
  }
}

# Allow flow from the vpc
resource "aws_network_acl_rule" "fromvpc" {
  network_acl_id = aws_network_acl.dmz.id
  rule_number    = 100
  egress         = false
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = var.vpc_cidr
  from_port      = 0
  to_port        = 0
}

# Allow http internet access into the dmz
resource "aws_network_acl_rule" "http" {
  network_acl_id = aws_network_acl.dmz.id
  rule_number    = 200
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 80
  to_port        = 80
}

# Allow https internet access into the dmz
resource "aws_network_acl_rule" "https" {
  network_acl_id = aws_network_acl.dmz.id
  rule_number    = 300
  egress         = false
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 443
  to_port        = 443
}

resource "aws_network_acl_rule" "outbound" {
  network_acl_id = aws_network_acl.dmz.id
  rule_number    = 100
  egress         = true
  protocol       = -1
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = 0
  to_port        = 0
}

resource "aws_network_acl_rule" "outbound_check" {
  network_acl_id = aws_network_acl.dmz.id
  rule_number    = 200
  egress         = true
  protocol       = "tcp"
  rule_action    = "allow"
  cidr_block     = "161.181.29.0/0"
  from_port      = 0
  to_port        = 0
}
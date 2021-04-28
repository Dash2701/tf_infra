# security.tf

# ALB Security Group: Edit to restrict access to the application
resource "aws_security_group" "lb" {
  name        = "${var.app_name}-sgalb-${terraform.workspace}"
  description = "controls access to the ALB"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    protocol    = "tcp"
    from_port   = var.app_port
    to_port     = var.app_port
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.app_name}-sgalb-${terraform.workspace}"
    Terraform = True
  }


}

# Traffic to the DB cluter should only come from the ECS
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
    Name      = "${var.app_name}-sgdb${terraform.workspace}"
    Terraform = true
  }
}

# Traffic to the ECS cluster should only come from the ALB
resource "aws_security_group" "ecs_tasks" {
  name        = "ecs_tasks_sg_${var.app_name}_${terraform.workspace}"
  description = "allow inbound access from the ALB only"
  vpc_id      = aws_vpc.main_vpc.id

  ingress {
    protocol        = "tcp"
    from_port       = var.app_port
    to_port         = var.app_port
    security_groups = [aws_security_group.lb.id]
  }

  egress {
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    Name = "${var.app_name}-sgecs-${terraform.workspace}"
    Terraform = true
  }
}

resource "aws_security_group" "bastion" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name      = "${var.app_name}-sgBastion-${terraform.workspace}"
    Terraform = true
  }
}


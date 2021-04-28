# alb.tf

resource "aws_alb" "main" {
  name            = "alb-${var.app_name}-${terraform.workspace}"
  subnets         = aws_subnet.public_subnet.*.id
  security_groups = [aws_security_group.lb.id]

  tags = {
    Name      = "${var.app_name}-alb-${terraform.workspace}"
    Terraform = true
  }

}

resource "aws_alb_target_group" "app" {
  name        = "${var.app_name}-alb-target-group-${terraform.workspace}"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main_vpc.id
  target_type = "ip"

  health_check {
    healthy_threshold   = "3"
    interval            = "30"
    protocol            = "HTTP"
    matcher             = "200"
    timeout             = "3"
    path                = var.health_check_path
    unhealthy_threshold = "2"
  }
}

# Redirect all traffic from the ALB to the target group
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = aws_alb.main.id
  port              = var.app_port
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.app.id
    type             = "forward"
  }
}


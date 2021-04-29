# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-ecs-cluster-${terraform.workspace}"

  tags = {
    Name      = "${var.app_name}-ecs-cluster-${terraform.workspace}"
    Terraform = true
  }
}



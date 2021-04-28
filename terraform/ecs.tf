# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "ecs_cluster_${var.app_name}_${terraform.workspace}"

  tags = {
    Name      = "${var.app_name}-ecs-cluster-${terraform.workspace}"
    Terraform = true
  }
}



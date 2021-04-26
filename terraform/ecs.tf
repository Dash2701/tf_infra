# ecs.tf

resource "aws_ecs_cluster" "main" {
  name = "ecs_cluster_${var.app_name}_${terraform.workspace}"

  tags = {
    Name      = "ecs_cluster_${var.app_name}_${terraform.workspace}"
    Terraform = true
  }
}



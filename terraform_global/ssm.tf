resource "aws_ssm_parameter" "ecs_cluster_arn_ssm" {
  name      = "${var.app_name}-ecs-cluster-${terraform.workspace}-arn"
  type      = "String"
  value     = aws_ecs_cluster.main.arn
  overwrite = true
}

resource "aws_ssm_parameter" "ecs_cluster_id_ssm" {
  name      = "${var.app_name}-ecs-cluster-${terraform.workspace}-id"
  type      = "String"
  value     = aws_ecs_cluster.main.id
  overwrite = true
}

resource "aws_ssm_parameter" "ecs_subnet_group_ssm" {
  name      = "${var.app_name}-ecs-subnet-${terraform.workspace}"
  type      = "String"
  value     = aws_subnet.private_subnet[0].id
  overwrite = true
}

resource "aws_ssm_parameter" "alb_target_group_arn_ssm" {
  name      = "${var.app_name}-alb-target-grp-${terraform.workspace}"
  type      = "String"
  value     = aws_alb_target_group.app.arn
  overwrite = true
}

resource "aws_ssm_parameter" "ecs_security_group_ssm" {
  name      = "${var.app_name}-ecs-sg-${terraform.workspace}"
  type      = "String"
  value     = aws_security_group.app_sg.id
  overwrite = true
}
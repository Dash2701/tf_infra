# outputs.tf
output "aws_region" {
  value = var.aws_region
}

output "workspace" {
  value = "${terraform.workspace}"
}

output "alb_hostname" {
  value = aws_alb.main.dns_name
}

output "alb_arn" {
  value = aws_alb.main.arn
}

output "ecs_cluster_arn" {
  value = aws_ecs_cluster.main.arn
}

output "ecs_cluster_id" {
  value = aws_ecs_cluster.main.id
}

output "cloudwatch_group" {
  value = aws_cloudwatch_log_group.app_log_group.arn
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}





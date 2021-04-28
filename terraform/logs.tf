# logs.tf

# Set up CloudWatch group and log stream and retain logs for 30 days
resource "aws_cloudwatch_log_group" "app_log_group" {
  name              = "/ecs/fargate/demo"
  retention_in_days = 30

  tags = {
    Name = "${var.app_name}-applog-${terraform.workspace}"
  }
}

resource "aws_cloudwatch_log_stream" "app-log-stream" {
  name           = "app-log-stream"
  log_group_name = aws_cloudwatch_log_group.app_log_group.name
}


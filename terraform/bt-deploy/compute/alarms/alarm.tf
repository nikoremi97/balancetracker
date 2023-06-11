resource "aws_cloudwatch_metric_alarm" "no_tasks_running" {
  alarm_name          = "tasks-not-running"
  alarm_actions       = [aws_sns_topic.cloudwatch_alarms.arn]
  alarm_description   = <<-EOT
        # Tasks not running in balancetracker cluster
        *please check why there are no task running*
        EOT
  comparison_operator = "LessThanThreshold"
  datapoints_to_alarm = 1
  dimensions = {
    "ClusterName" = var.cluster_name
    "ServiceName" = var.service_name
  }
  evaluation_periods = 1
  metric_name        = "RunningTaskCount"
  namespace          = "ECS/ContainerInsights"
  period             = 60
  statistic          = "Sum"
  tags               = var.tags
  threshold          = 1
  treat_missing_data = "notBreaching"
}
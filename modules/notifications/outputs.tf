output "cloudwatch_event_rule_details" {
  description = "Details of CloudWatch event rule"
  value = length(aws_cloudwatch_event_rule.main) > 0 ? {
    arn           = aws_cloudwatch_event_rule.main[0].arn
    name          = aws_cloudwatch_event_rule.main[0].name
    description   = aws_cloudwatch_event_rule.main[0].description
    event_pattern = aws_cloudwatch_event_rule.main[0].event_pattern
  } : null
}

output "cloudwatch_event_target_slack_id" {
  description = "Id of CloudWatch event target for Slack"
  value       = length(aws_cloudwatch_event_target.slack) > 0 ? aws_cloudwatch_event_target.slack[0].target_id : null
}

output "cloudwatch_event_target_slack_arn" {
  description = "ARN of CloudWatch event target for Slack"
  value       = length(aws_cloudwatch_event_target.slack) > 0 ? aws_cloudwatch_event_target.slack[0].arn : null
}

output "cloudwatch_event_target_pagerduty_id" {
  description = "Id of CloudWatch event target for PagerDuty"
  value       = length(aws_cloudwatch_event_target.pagerduty) > 0 ? aws_cloudwatch_event_target.pagerduty[0].target_id : null
}

output "cloudwatch_event_target_pagerduty_arn" {
  description = "ARN of CloudWatch event target for PagerDuty"
  value       = length(aws_cloudwatch_event_target.pagerduty) > 0 ? aws_cloudwatch_event_target.pagerduty[0].arn : null
}

output "cloudwatch_event_target_email_id" {
  description = "Id of CloudWatch event target for Email"
  value       = length(aws_cloudwatch_event_target.email) > 0 ? aws_cloudwatch_event_target.email[0].target_id : null
}

output "cloudwatch_event_target_email_arn" {
  description = "ARN of CloudWatch event target for Email"
  value       = length(aws_cloudwatch_event_target.email) > 0 ? aws_cloudwatch_event_target.email[0].arn : null
}

output "sns_topic_subscription_details_email" {
  description = "Details of SNS topic"
  value = length(aws_sns_topic_subscription.email) > 0 ? {
    id        = aws_sns_topic_subscription.email[0].id
    topic_arn = aws_sns_topic_subscription.email[0].topic_arn
    endpoint  = aws_sns_topic_subscription.email[0].endpoint
    protocol  = aws_sns_topic_subscription.email[0].protocol
    confirmed = aws_sns_topic_subscription.email[0].confirmation_was_authenticated
  } : null
}

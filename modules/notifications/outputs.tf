output "cloudwatch_event_rule_details" {
  description = "Details of CloudWatch event rule"
  value = {
    arn           = aws_cloudwatch_event_rule.main.arn
    name          = aws_cloudwatch_event_rule.main.name
    description   = aws_cloudwatch_event_rule.main.description
    event_pattern = aws_cloudwatch_event_rule.main.event_pattern
  }
}

output "cloudwatch_event_target_slack_id" {
  description = "Id of CloudWatch event target for Slack"
  value       = aws_cloudwatch_event_target.slack.target_id
}

output "cloudwatch_event_target_slack_arn" {
  description = "ARN of CloudWatch event target for Slack"
  value       = aws_cloudwatch_event_target.slack.arn
}

output "cloudwatch_event_target_pagerduty_id" {
  description = "Id of CloudWatch event target for PagerDuty"
  value       = aws_cloudwatch_event_target.pagerduty.target_id
}

output "cloudwatch_event_target_pagerduty_arn" {
  description = "ARN of CloudWatch event target for PagerDuty"
  value       = aws_cloudwatch_event_target.pagerduty.arn
}

output "cloudwatch_event_target_email_id" {
  description = "Id of CloudWatch event target for Email"
  value       = aws_cloudwatch_event_target.email.target_id
}

output "cloudwatch_event_target_email_arn" {
  description = "ARN of CloudWatch event target for Email"
  value       = aws_cloudwatch_event_target.email.arn
}

output "sns_topic_subscription_details_email" {
  value = {
    id                         = aws_sns_topic_subscription.email.id
    topic_arn                  = aws_sns_topic_subscription.email.topic_arn
    endpoint                   = aws_sns_topic_subscription.email.endpoint
    protocol                   = aws_sns_topic_subscription.email.protocol
    confirmation_authenticated = aws_sns_topic_subscription.email.confirmation_was_authenticated
  }
}

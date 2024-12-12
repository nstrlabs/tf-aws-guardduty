##################################################
# CloudWatch Event
##################################################
resource "aws_cloudwatch_event_rule" "main" {
  count         = var.slack_notifications || var.email_notifications || var.pagerduty_notifications ? 1 : 0
  name          = "OnumGuarddutyFindingEvents"
  description   = "AWS GuardDuty event findings"
  event_pattern = file("${path.module}/event-pattern.json")
}

# More details about the response syntax can be found here:
# https://docs.aws.amazon.com/guardduty/latest/ug/get-findings.html#get-findings-response-syntax
resource "aws_cloudwatch_event_target" "slack" {
  count = var.slack_notifications ? 1 : 0

  rule      = aws_cloudwatch_event_rule.main[0].name
  target_id = "send-to-sns-slack"
  arn       = var.sns_topic_slack_arn

  input_transformer {
    input_paths = {
      title       = "$.detail.title"
      account     = "$.detail.accountId"
      description = "$.detail.description"
      eventTime   = "$.detail.service.eventFirstSeen"
      region      = "$.detail.region"
    }

    input_template = "\"GuardDuty finding for <account> in <region> first seen at <eventTime>: <title> <description>\""
  }
}

resource "aws_cloudwatch_event_target" "pagerduty" {
  count = var.pagerduty_notifications ? 1 : 0

  rule      = aws_cloudwatch_event_rule.main[0].name
  target_id = "send-to-sns-pagerduty"
  arn       = var.sns_topic_pagerduty_arn
}

resource "aws_cloudwatch_event_target" "email" {
  count = var.email_notifications ? 1 : 0

  rule      = aws_cloudwatch_event_rule.main[0].name
  target_id = "send-to-sns-email"
  arn       = var.sns_topic_email_arn

  input_transformer {
    input_paths = {
      severity    = "$.detail.severity",
      account     = "$.detail.accountId",
      id          = "$.detail.id",
      type        = "$.detail.type",
      title       = "$.detail.title"
      description = "$.detail.description"
      eventTime   = "$.detail.service.eventFirstSeen"
      region      = "$.detail.region"
    }

    input_template = "\"AWS <account> has a severity <severity> GuardDuty finding type <type> in the <region> region.\\nFinding Description:<description>.\\nFor more details open the GuardDuty console at https://console.aws.amazon.com/guardduty/home?region=<region>#/findings?search=id=<id>\""
  }
}

resource "aws_sns_topic_subscription" "email" {
  count = var.email_notifications ? 1 : 0

  protocol  = "email"
  endpoint  = var.sns_topic_email_endpoint
  topic_arn = var.sns_topic_email_arn
}

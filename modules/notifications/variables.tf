##################################################
# GuardDuty Notifications
##################################################
variable "pagerduty_notifications" {
  description = "Enable PagerDuty notifications for GuardDuty findings"
  type        = bool
  default     = false
}

variable "slack_notifications" {
  description = "Enable Slack notifications for GuardDuty findings"
  type        = bool
  default     = false
}

variable "email_notifications" {
  description = "Enable Email notifications for GuardDuty findings"
  type        = bool
  default     = false
}

variable "sns_topic_slack_arn" {
  description = "Slack SNS Topic ARN"
  type        = string
  default     = null
}

variable "sns_topic_pagerduty_arn" {
  description = "PagerDuty SNS Topic ARN"
  type        = string
  default     = null
}

variable "sns_topic_email_arn" {
  description = "Email SNS Topic ARN"
  type        = string
  default     = null
}

variable "sns_topic_email_endpoint" {
  description = "Email SNS Topic endpoint"
  type        = string
  default     = null
}

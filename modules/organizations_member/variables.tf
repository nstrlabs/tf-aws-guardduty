##################################################
# GuardDuty Organizations Detector Member
##################################################
variable "guardduty_detector_id" {
  description = "The detector ID of the GuardDuty account. Defaults to `null`."
  type        = string
  default     = null
}

variable "master_account_id" {
  description = "AWS account ID for primary account. Defaults to `null`"
  type        = string
  default     = null
}

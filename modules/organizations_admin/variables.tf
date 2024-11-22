##################################################
# GuardDuty Organizations Delegated Admin
##################################################
variable "guardduty_detector_id" {
  description = "The detector ID of the GuardDuty account."
  type        = string
}

variable "enable_s3_protection" {
  description = "Configure and enable S3 protection. Defaults to `true`."
  type        = bool
  default     = true
}

variable "enable_kubernetes_protection" {
  description = "Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_malware_protection" {
  description = "Configure and enable Malware Protection as data source for EC2 instances or EKS with findings for the detector. Defaults to `false`."
  type        = bool
  default     = false
}

variable "enable_rds_protection" {
  description = "Configure and enable RDS protection analyzing login activity for potential access threats. Defaults to `false`."
  type        = bool
  default     = false
}

variable "admin_account_id" {
  description = "AWS account identifier to designate as a delegated administrator for GuardDuty. Defaults to `null`"
  type        = string
  default     = null
}

variable "auto_enable_organization_members" {
  description = "Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`."
  type        = string
  default     = "ALL"
}

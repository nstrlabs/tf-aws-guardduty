##################################################
# GuardDuty Organizations Delegated Admin
##################################################
resource "aws_organizations_organization" "this" {
  aws_service_access_principals = ["guardduty.amazonaws.com"]
  feature_set                   = "ALL"
}

resource "aws_guardduty_organization_admin_account" "this" {
  count            = var.admin_account_id == null ? 0 : 1
  admin_account_id = var.admin_account_id
}

resource "aws_guardduty_organization_configuration" "this" {
  count = var.admin_account_id == null ? 0 : 1

  auto_enable_organization_members = var.auto_enable_organization_members
  detector_id                      = var.guardduty_detector_id
}

resource "aws_guardduty_organization_configuration_feature" "s3_data_events" {
  detector_id = var.guardduty_detector_id
  name        = "S3_DATA_EVENTS"
  auto_enable = var.enable_s3_protection ? "ALL" : "NONE"
}

resource "aws_guardduty_organization_configuration_feature" "runtime_monitoring" {
  detector_id = var.guardduty_detector_id
  name        = "RUNTIME_MONITORING"
  auto_enable = var.enable_malware_protection ? "ALL" : "NONE"

  additional_configuration {
    name        = "EKS_ADDON_MANAGEMENT"
    auto_enable = var.enable_malware_protection ? "ALL" : "NONE"
  }
  additional_configuration {
    name        = "EC2_AGENT_MANAGEMENT"
    auto_enable = var.enable_malware_protection ? "ALL" : "NONE"
  }
}

resource "aws_guardduty_organization_configuration_feature" "eks_audit_logs" {
  detector_id = var.guardduty_detector_id
  name        = "EKS_AUDIT_LOGS"
  auto_enable = var.enable_kubernetes_protection ? "ALL" : "NONE"
}

resource "aws_guardduty_organization_configuration_feature" "ebs_malware_protection" {
  detector_id = var.guardduty_detector_id
  name        = "EBS_MALWARE_PROTECTION"
  auto_enable = var.enable_malware_protection ? "ALL" : "NONE"
}

resource "aws_guardduty_organization_configuration_feature" "rds_login_events" {
  detector_id = var.guardduty_detector_id
  name        = "RDS_LOGIN_EVENTS"
  auto_enable = var.enable_rds_protection ? "ALL" : "NONE"
}

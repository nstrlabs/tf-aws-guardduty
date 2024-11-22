##################################################
# GuardDuty Organizations Delegated Admin
##################################################
resource "aws_guardduty_organization_admin_account" "this" {
  count            = var.admin_account_id == null ? 0 : 1
  admin_account_id = var.admin_account_id
}

resource "aws_guardduty_organization_configuration" "this" {
  count = var.admin_account_id == null ? 0 : 1

  auto_enable                      = var.auto_enable_organization_members != null ? null : var.auto_enable_org_config
  auto_enable_organization_members = var.auto_enable_org_config != null ? null : var.auto_enable_organization_members
  detector_id                      = var.guardduty_detector_id
}

resource "aws_guardduty_organization_configuration_feature" "s3_data_events" {
  detector_id = aws_guardduty_detector.primary.id
  name        = "S3_DATA_EVENTS"
  status      = var.enable_s3_protection ? "ENABLED" : "DISABLED"
}

resource "aws_guardduty_organization_configuration_feature" "runtime_monitoring" {
  detector_id = aws_guardduty_detector.primary.id
  name        = "RUNTIME_MONITORING"
  status      = var.enable_malware_protection ? "ENABLED" : "DISABLED"

  additional_configuration {
    name   = "EKS_ADDON_MANAGEMENT"
    status = var.enable_malware_protection ? "ENABLED" : "DISABLED"
  }
  additional_configuration {
    name   = "EC2_AGENT_MANAGEMENT"
    status = var.enable_malware_protection ? "ENABLED" : "DISABLED"
  }
}

resource "aws_guardduty_organization_configuration_feature" "eks_audit_logs" {
  detector_id = aws_guardduty_detector.primary.id
  name        = "EKS_AUDIT_LOGS"
  status      = var.enable_kubernetes_protection ? "ENABLED" : "DISABLED"
}

resource "aws_guardduty_organization_configuration_feature" "ebs_malware_protection" {
  detector_id = aws_guardduty_detector.primary.id
  name        = "EBS_MALWARE_PROTECTION"
  status      = var.enable_malware_protection ? "ENABLED" : "DISABLED"
}

resource "aws_guardduty_organization_configuration_feature" "rds_login_events" {
  detector_id = aws_guardduty_detector.primary.id
  name        = "RDS_LOGIN_EVENTS"
  status      = var.enable_rds_protection ? "ENABLED" : "DISABLED"
}

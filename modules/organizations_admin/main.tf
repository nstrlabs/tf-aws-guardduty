##################################################
# GuardDuty Organizations Delegated Admin
##################################################

locals {
  organization_configuration_features = {
    "LAMBDA_NETWORK_LOGS" = { auto_enable = var.auto_enable_lambda_network_logs }
    "RDS_LOGIN_EVENTS"    = { auto_enable = var.auto_enable_rds_login_events }
    "EKS_RUNTIME_MONITORING" = { auto_enable = var.auto_enable_eks_runtime_monitoring
      additional_configuration = {
        "EKS_ADDON_MANAGEMENT" = { auto_enable = var.auto_enable_eks_addon_management }
      }
    }
    "RUNTIME_MONITORING" = { auto_enable = var.auto_enable_runtime_monitoring
      additional_configuration = {
        "EKS_ADDON_MANAGEMENT"         = { auto_enable = var.auto_enable_eks_addon_management }
        "EC2_AGENT_MANAGEMENT"         = { auto_enable = var.auto_enable_ec2_agent_management }
        "ECS_FARGATE_AGENT_MANAGEMENT" = { auto_enable = var.auto_enable_ecs_fargate_agent_management }
      }
    }
  }
}

resource "aws_guardduty_organization_configuration" "this" {
  auto_enable                      = var.auto_enable_organization_members != null ? null : var.auto_enable_org_config
  auto_enable_organization_members = var.auto_enable_org_config != null ? null : var.auto_enable_organization_members
  detector_id                      = var.guardduty_detector_id

  datasources {
    s3_logs {
      auto_enable = var.enable_s3_protection
    }
    kubernetes {
      audit_logs {
        enable = var.enable_kubernetes_protection
      }
    }
    malware_protection {
      scan_ec2_instance_with_findings {
        ebs_volumes {
          auto_enable = var.enable_malware_protection
        }
      }
    }
  }
}

##################################################
# GuardDuty Organizations Features Configuration
##################################################
resource "aws_guardduty_organization_configuration_feature" "this" {
  for_each    = { for k, v in local.organization_configuration_features : k => v if v.auto_enable != null }
  detector_id = var.guardduty_detector_id
  name        = each.key
  auto_enable = each.value.auto_enable

  dynamic "additional_configuration" {
    for_each = { for k, v in each.value.additional_configuration : k => v if v.auto_enable != null }
    content {
      name        = additional_configuration.key
      auto_enable = additional_configuration.value.auto_enable
    }
  }
}

##################################################
# GuardDuty Organizations Member
##################################################
resource "aws_guardduty_member" "this" {
  for_each = var.member_config != null ? { for member in var.member_config : member.account_id => member } : {}

  account_id                 = each.value.account_id
  detector_id                = var.guardduty_detector_id
  email                      = each.value.email
  invite                     = each.value.invite
  invitation_message         = each.value.invitation_message
  disable_email_notification = each.value.disable_email_notification

  lifecycle {
    ignore_changes = [
      # There is an existing issue for this https://github.com/hashicorp/terraform-provider-aws/issues/8206
      invite,
      disable_email_notification,
      invitation_message,
    ]
  }

  provisioner "local-exec" {
    command = "aws guardduty disassociate-members --detector-id ${self.detector_id} --account-ids ${self.account_id}"
    when    = destroy
  }
}

data "aws_caller_identity" "current" {}

##################################################
# GuardDuty Organizations Invite
##################################################
resource "aws_guardduty_invite_accepter" "member" {
  for_each = var.member_config != null ? { for member in var.member_config : member.account_id => member if member.invite } : {}

  detector_id       = var.guardduty_detector_id
  master_account_id = var.master_account_id == null ? data.aws_caller_identity.current.account_id : var.master_account_id
}

##################################################
# GuardDuty Organizations Invite
##################################################
output "guardduty_invite_accepter" {
  description = "AWS GuardDuty Detector invite."
  value       = aws_guardduty_invite_accepter.member
}

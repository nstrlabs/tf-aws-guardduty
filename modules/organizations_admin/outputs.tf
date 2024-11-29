##################################################
# GuardDuty Organizations Delegated Admin
##################################################
output "guardduty_organization_configuration" {
  description = "AWS GuardDuty Organizations configuration."
  value       = aws_guardduty_organization_configuration.this
}

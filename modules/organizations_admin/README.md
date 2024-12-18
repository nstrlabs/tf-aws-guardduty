## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_guardduty_organization_admin_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_admin_account) | resource |
| [aws_guardduty_organization_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_account_id"></a> [admin\_account\_id](#input\_admin\_account\_id) | AWS Organizations Admin Account Id. Defaults to `null` | `string` | `null` | no |
| <a name="input_auto_enable_org_config"></a> [auto\_enable\_org\_config](#input\_auto\_enable\_org\_config) | When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region. | `bool` | `null` | no |
| <a name="input_auto_enable_organization_members"></a> [auto\_enable\_organization\_members](#input\_auto\_enable\_organization\_members) | Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`. | `string` | `"NEW"` | no |
| <a name="input_enable_kubernetes_protection"></a> [enable\_kubernetes\_protection](#input\_enable\_kubernetes\_protection) | Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_enable_malware_protection"></a> [enable\_malware\_protection](#input\_enable\_malware\_protection) | Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_enable_s3_protection"></a> [enable\_s3\_protection](#input\_enable\_s3\_protection) | Configure and enable S3 protection. Defaults to `true`. | `bool` | `true` | no |
| <a name="input_guardduty_detector_id"></a> [guardduty\_detector\_id](#input\_guardduty\_detector\_id) | The detector ID of the GuardDuty account. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_guardduty_delegated_admin_account"></a> [guardduty\_delegated\_admin\_account](#output\_guardduty\_delegated\_admin\_account) | AWS GuardDuty Delegated Admin account. |
| <a name="output_guardduty_organization_configuration"></a> [guardduty\_organization\_configuration](#output\_guardduty\_organization\_configuration) | AWS GuardDuty Organizations configuration. |

[//]: # (BEGIN_TF_DOCS)
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | >= 5.0 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.4 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 5.0 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [aws_guardduty_member.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_member) | resource |
| [aws_guardduty_organization_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration) | resource |
| [aws_guardduty_organization_configuration_feature.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_auto_enable_ec2_agent_management"></a> [auto_enable_ec2_agent_management](#input_auto_enable_ec2_agent_management) | Auto-enable EC2 Agent Management additional configuration of Runtime Monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_ecs_fargate_agent_management"></a> [auto_enable_ecs_fargate_agent_management](#input_auto_enable_ecs_fargate_agent_management) | Auto-enable ECS Fargate Agent Management  additional configuration of Runtime Monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_eks_addon_management"></a> [auto_enable_eks_addon_management](#input_auto_enable_eks_addon_management) | Auto-enable EKS Addon Management additional configuration of EKS Runtime Monitoring/Runtime Monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_eks_runtime_monitoring"></a> [auto_enable_eks_runtime_monitoring](#input_auto_enable_eks_runtime_monitoring) | Auto-enable EKS Runtime Monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_lambda_network_logs"></a> [auto_enable_lambda_network_logs](#input_auto_enable_lambda_network_logs) | Auto-enable Lambda network logs monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_org_config"></a> [auto_enable_org_config](#input_auto_enable_org_config) | When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region. | `bool` |
| <a name="input_auto_enable_organization_members"></a> [auto_enable_organization_members](#input_auto_enable_organization_members) | Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`. | `string` |
| <a name="input_auto_enable_rds_login_events"></a> [auto_enable_rds_login_events](#input_auto_enable_rds_login_events) | Auto-enable RDS login events monitoring for the member accounts within the organization. | `string` |
| <a name="input_auto_enable_runtime_monitoring"></a> [auto_enable_runtime_monitoring](#input_auto_enable_runtime_monitoring) | Auto-enable Runtime Monitoring for the member accounts within the organization. | `string` |
| <a name="input_enable_kubernetes_protection"></a> [enable_kubernetes_protection](#input_enable_kubernetes_protection) | Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `true`. | `bool` |
| <a name="input_enable_malware_protection"></a> [enable_malware_protection](#input_enable_malware_protection) | Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`. | `bool` |
| <a name="input_enable_s3_protection"></a> [enable_s3_protection](#input_enable_s3_protection) | Configure and enable S3 protection. Defaults to `true`. | `bool` |
| <a name="input_guardduty_detector_id"></a> [guardduty_detector_id](#input_guardduty_detector_id) | The detector ID of the GuardDuty account. | `string` |
| <a name="input_member_config"></a> [member_config](#input_member_config) | Specifies the member account configuration:<br/>  `account_id`                 - The 13 digit ID number of the member account. Example: `123456789012`.<br/>  `email`                      - Email address to send the invite for member account. Defaults to `null`.<br/>  `invite`                     - Whether to invite the account to GuardDuty as a member. Defaults to `false`. To detect if an invitation needs to be (re-)sent, the Terraform state value is true based on a relationship_status of `Disabled` \| `Enabled` \|  `Invited` \|  EmailVerificationInProgress.<br/>  `invitation_message`         - Message for invitation. Defaults to `null`.<br/>  `disable_email_notification` - Whether an email notification is sent to the accounts. Defaults to `false`. | <pre>list(object({<br/>    account_id                 = string<br/>    email                      = string<br/>    invite                     = bool<br/>    invitation_message         = optional(string)<br/>    disable_email_notification = optional(bool)<br/>  }))</pre> |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_guardduty_organization_configuration"></a> [guardduty_organization_configuration](#output_guardduty_organization_configuration) | AWS GuardDuty Organizations configuration. |

[//]: # (END_TF_DOCS)

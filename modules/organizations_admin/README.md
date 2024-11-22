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
| <a name="requirement_aws"></a> [aws](#requirement_aws) | >= 4.47 |
| <a name="requirement_random"></a> [random](#requirement_random) | >= 3.4 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | >= 4.47 |

#### Modules

No modules.

#### Resources

| Name | Type |
|------|------|
| [aws_guardduty_organization_admin_account.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_admin_account) | resource |
| [aws_guardduty_organization_configuration.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration) | resource |
| [aws_guardduty_organization_configuration_feature.ebs_malware_protection](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |
| [aws_guardduty_organization_configuration_feature.eks_audit_logs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |
| [aws_guardduty_organization_configuration_feature.rds_login_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |
| [aws_guardduty_organization_configuration_feature.runtime_monitoring](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |
| [aws_guardduty_organization_configuration_feature.s3_data_events](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_organization_configuration_feature) | resource |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_admin_account_id"></a> [admin_account_id](#input_admin_account_id) | AWS Organizations Admin Account Id. Defaults to `null` | `string` |
| <a name="input_auto_enable_org_config"></a> [auto_enable_org_config](#input_auto_enable_org_config) | When this setting is enabled, all new accounts that are created in, or added to, the organization are added as a member accounts of the organization’s GuardDuty delegated administrator and GuardDuty is enabled in that AWS Region. | `bool` |
| <a name="input_auto_enable_organization_members"></a> [auto_enable_organization_members](#input_auto_enable_organization_members) | Indicates the auto-enablement configuration of GuardDuty for the member accounts in the organization. Valid values are `ALL`, `NEW`, `NONE`. Defaults to `NEW`. | `string` |
| <a name="input_enable_kubernetes_protection"></a> [enable_kubernetes_protection](#input_enable_kubernetes_protection) | Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `false`. | `bool` |
| <a name="input_enable_malware_protection"></a> [enable_malware_protection](#input_enable_malware_protection) | Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `false`. | `bool` |
| <a name="input_enable_s3_protection"></a> [enable_s3_protection](#input_enable_s3_protection) | Configure and enable S3 protection. Defaults to `true`. | `bool` |
| <a name="input_guardduty_detector_id"></a> [guardduty_detector_id](#input_guardduty_detector_id) | The detector ID of the GuardDuty account. | `string` |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_guardduty_delegated_admin_account"></a> [guardduty_delegated_admin_account](#output_guardduty_delegated_admin_account) | AWS GuardDuty Delegated Admin account. |
| <a name="output_guardduty_organization_configuration"></a> [guardduty_organization_configuration](#output_guardduty_organization_configuration) | AWS GuardDuty Organizations configuration. |

[//]: # (END_TF_DOCS)

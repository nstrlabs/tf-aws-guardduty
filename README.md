# tf-modules-template
Template for creating terraform modules

## Quick start
Check https://nwdlabs.atlassian.net/wiki/spaces/INF/pages/539787266/Create+terraform+module+from+template for information about the template

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
| <a name="provider_aws.replica"></a> [aws.replica](#provider_aws.replica) | >= 4.47 |
| <a name="provider_random"></a> [random](#provider_random) | >= 3.4 |

#### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_log_bucket"></a> [log_bucket](#module_log_bucket) | terraform-aws-modules/s3-bucket/aws | 3.14.0 |
| <a name="module_replica_bucket"></a> [replica_bucket](#module_replica_bucket) | terraform-aws-modules/s3-bucket/aws | 3.14.0 |
| <a name="module_s3_bucket"></a> [s3_bucket](#module_s3_bucket) | terraform-aws-modules/s3-bucket/aws | 3.14.0 |

#### Resources

| Name | Type |
|------|------|
| [aws_guardduty_detector.primary](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_guardduty_filter.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_filter) | resource |
| [aws_guardduty_ipset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_ipset) | resource |
| [aws_guardduty_publishing_destination.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_publishing_destination) | resource |
| [aws_guardduty_threatintelset.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_threatintelset) | resource |
| [aws_iam_policy.bucket_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.bucket_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_kms_key.guardduty_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_kms_key.replica_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_object.ipset_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_s3_object.threatintelset_object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bucket_replication](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.bucket_replication_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.guardduty_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.guardduty_kms_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.guardduty_replica_bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

#### Inputs

| Name | Description | Type |
|------|-------------|------|
| <a name="input_enable_guardduty"></a> [enable_guardduty](#input_enable_guardduty) | Enable monitoring and feedback reporting. Setting to false is equivalent to 'suspending' GuardDuty. Defaults to `true`. | `bool` |
| <a name="input_enable_kubernetes_protection"></a> [enable_kubernetes_protection](#input_enable_kubernetes_protection) | Configure and enable Kubernetes audit logs as a data source for Kubernetes protection. Defaults to `true`. | `bool` |
| <a name="input_enable_malware_protection"></a> [enable_malware_protection](#input_enable_malware_protection) | Configure and enable Malware Protection as data source for EC2 instances with findings for the detector. Defaults to `true`. | `bool` |
| <a name="input_enable_s3_protection"></a> [enable_s3_protection](#input_enable_s3_protection) | Configure and enable S3 protection. Defaults to `true`. | `bool` |
| <a name="input_enable_snapshot_retention"></a> [enable_snapshot_retention](#input_enable_snapshot_retention) | Enable EBS Snaptshot retention for 30 days, if any Findings exists. Defaults to `false`. | `bool` |
| <a name="input_filter_config"></a> [filter_config](#input_filter_config) | Specifies AWS GuardDuty Filter configuration.<br/>  `name` - The name of the filter<br/>  `rank` - Specifies the position of the filter in the list of current filters. Also specifies the order in which this filter is applied to the findings.<br/>  `action` - Specifies the action that is to be applied to the findings that match the filter. Can be one of ARCHIVE or NOOP.<br/>  `criterion` - Configuration block for `finding_criteria`. Composed by `field` and one or more of the following operators: `equals` \| `not_equals` \| `greater_than` \| `greater_than_or_equal` \| `less_than` \| `less_than_or_equal`. | <pre>list(object({<br/>    name        = string<br/>    description = optional(string)<br/>    rank        = number<br/>    action      = string<br/>    criterion = list(object({<br/>      field                 = string<br/>      equals                = optional(list(string))<br/>      not_equals            = optional(list(string))<br/>      greater_than          = optional(string)<br/>      greater_than_or_equal = optional(string)<br/>      less_than             = optional(string)<br/>      less_than_or_equal    = optional(string)<br/>    }))<br/>  }))</pre> |
| <a name="input_finding_publishing_frequency"></a> [finding_publishing_frequency](#input_finding_publishing_frequency) | Specifies the frequency of notifications sent for subsequent finding occurrences. If the detector is a GuardDuty member account, the value is determined by the GuardDuty primary account and cannot be modified. For standalone and GuardDuty primary accounts, it must be configured in Terraform to enable drift detection. Valid values for standalone and primary accounts: `FIFTEEN_MINUTES`, `ONE_HOUR`, `SIX_HOURS`. Defaults to `SIX_HOURS`. | `string` |
| <a name="input_guardduty_bucket_acl"></a> [guardduty_bucket_acl](#input_guardduty_bucket_acl) | Canned ACL to apply to the bucket. Valid values are `private` \| `public-read` \| `public-read-write` \| `aws-exec-read` \| `authenticated-read` \| `bucket-owner-read` \| `bucket-owner-full-control`. Defaults to `null`. | `string` |
| <a name="input_guardduty_s3_bucket"></a> [guardduty_s3_bucket](#input_guardduty_s3_bucket) | Name of the S3 Bucket for GuardDuty. Defaults to `null`. | `string` |
| <a name="input_ipset_config"></a> [ipset_config](#input_ipset_config) | Specifies AWS GuardDuty IPSet configuration.<br/>  `activate` - Specifies whether GuardDuty is to start using the uploaded IPSet.<br/>  `name` - The friendly name to identify the IPSet.<br/>  `format` - The format of the file that contains the IPSet. Valid values: `TXT` \| `STIX` \| `OTX_CSV` \| `ALIEN_VAULT` \| `PROOF_POINT` \| `FIRE_EYE`.<br/>  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.<br/>  `key` - Name of the object once it is in the bucket. | <pre>list(object({<br/>    activate = bool<br/>    name     = string<br/>    format   = string<br/>    content  = string<br/>    key      = string<br/>  }))</pre> |
| <a name="input_publish_to_s3"></a> [publish_to_s3](#input_publish_to_s3) | Specifies if the Amazon GuardDuty findings should be exported to S3. Defaults to `false`. | `bool` |
| <a name="input_publishing_config"></a> [publishing_config](#input_publishing_config) | Defines the findings publishing configuration. | <pre>list(object({<br/>    destination_arn  = string<br/>    kms_key_arn      = string<br/>    destination_type = optional(string)<br/>  }))</pre> |
| <a name="input_replica_region"></a> [replica_region](#input_replica_region) | Region where S3 bucket data from Amazon GuardDuty will be replicated. Defaults to `null`. | `string` |
| <a name="input_tags"></a> [tags](#input_tags) | Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level. Defaults to `{}`. | `map(any)` |
| <a name="input_threatintelset_config"></a> [threatintelset_config](#input_threatintelset_config) | Specifies AWS GuardDuty ThreatIntelSet configuration.<br/>  `activate` - Specifies whether GuardDuty is to start using the uploaded ThreatIntelSet.<br/>  `name` - The friendly name to identify the ThreatIntelSet.<br/>  `format` - The format of the file that contains the ThreatIntelSet. Valid values: `TXT` \| `STIX` \| `OTX_CSV` \| `ALIEN_VAULT` \| `PROOF_POINT` \| `FIRE_EYE`.<br/>  `content`- Literal string value to use as the object content, which will be uploaded as UTF-8-encoded text. Example: `10.0.0.0/8\n`.<br/>  `key` - Name of the object once it is in the bucket.<br/>  `object_acl`- Canned ACL to apply to the object. Valid values are `private` \| `public-read` \| `public-read-write` \| `aws-exec-read` \| `authenticated-read` \| `bucket-owner-read` \| `bucket-owner-full-control`. | <pre>list(object({<br/>    activate   = bool<br/>    name       = string<br/>    format     = string<br/>    content    = string<br/>    key        = string<br/>    object_acl = string<br/>  }))</pre> |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_guardduty_detector"></a> [guardduty_detector](#output_guardduty_detector) | AWS GuardDuty Detector. |
| <a name="output_guardduty_filter"></a> [guardduty_filter](#output_guardduty_filter) | AWS GuardDuty Findings Filters definition. |
| <a name="output_guardduty_ipset"></a> [guardduty_ipset](#output_guardduty_ipset) | AWS GuardDuty trusted IPSet configuration. |
| <a name="output_guardduty_kms_key"></a> [guardduty_kms_key](#output_guardduty_kms_key) | Amazon KMS Key created to encrypt AWS GuardDuty's S3 Bucket. |
| <a name="output_guardduty_kms_replica_key"></a> [guardduty_kms_replica_key](#output_guardduty_kms_replica_key) | Amazon KMS Key created to encrypt AWS GuardDuty's S3 Replica Bucket. |
| <a name="output_guardduty_log_bucket"></a> [guardduty_log_bucket](#output_guardduty_log_bucket) | Amazon S3 Log Bucket created for AWS GuardDuty. |
| <a name="output_guardduty_publishing"></a> [guardduty_publishing](#output_guardduty_publishing) | AWS GuardDuty Publishing destination to export findings. |
| <a name="output_guardduty_replica_bucket"></a> [guardduty_replica_bucket](#output_guardduty_replica_bucket) | Amazon S3 Replica Bucket created for AWS GuardDuty. |
| <a name="output_guardduty_s3_bucket"></a> [guardduty_s3_bucket](#output_guardduty_s3_bucket) | Amazon S3 Bucket created for AWS GuardDuty. |
| <a name="output_guardduty_threatintelset"></a> [guardduty_threatintelset](#output_guardduty_threatintelset) | AWS GuardDuty known ThreatIntelSet configuration. |

[//]: # (END_TF_DOCS)

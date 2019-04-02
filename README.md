### terraform-aws-credstash<--

#### TL;DR;
- [Inputs](#input)
- [Outputs](#output)

## Credstash Setup

Setup KMS Master Key and a DynamoDB Table for use with Credstash.





## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| db\_table\_name | Name of the DynamoDB table where credentials will be stored | string | `"credential-store"` | no |
| dynamodb\_tags |  | map | `<map>` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled | string | `"false"` | no |
| kms\_key\_name | KMS Master Key Name. | string | `"credstash"` | no |
| kms\_tags |  | map | `<map>` | no |
| read\_roles |  | list | `<list>` | no |
| read\_users |  | list | `<list>` | no |
| tags |  | map | `<map>` | no |
| write\_roles |  | list | `<list>` | no |
| write\_users |  | list | `<list>` | no |

## Outputs

| Name | Description |
|------|-------------|
| db\_table\_arn | DynamoDB table ARN that can be used by credstash to store/retrieve secrets. |
| db\_table\_name | DynamoDB table name that can be used by credstash to store/retrieve secrets. |
| kms\_key\_alias | KMS Master key alias. It can later be used to store and retrieve secrets. |
| kms\_key\_alias\_arn | KMS Master key alias ARN. |
| kms\_key\_arn | KMS Key ARN. It can later be used to store and retrieve secrets. |
| kms\_key\_id | KMS Master key id. |


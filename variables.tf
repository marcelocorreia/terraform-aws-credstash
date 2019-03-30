variable "tags" {
  default = {}
  type    = "map"
}

variable "kms_tags" {
  default = {}
  type    = "map"
}

variable "dynamodb_tags" {
  default = {}
  type    = "map"
}

variable "kms_key_name" {
  default     = "credstash"
  description = "KMS Master Key Name."
}

variable "enable_key_rotation" {
  default     = false
  description = "Specifies whether key rotation is enabled"
}

variable "db_table_name" {
  default     = "credential-store"
  description = "Name of the DynamoDB table where credentials will be stored"
}

variable "read_users" {
  type    = "list"
  default = []
}

variable "write_users" {
  type    = "list"
  default = []
}

variable "read_roles" {
  type    = "list"
  default = []
}

variable "write_roles" {
  type    = "list"
  default = []
}

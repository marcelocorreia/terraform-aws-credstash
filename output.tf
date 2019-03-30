output "kms_key_arn" {
  value       = "${aws_kms_key.credstash-key.*.arn}"
  description = "KMS Key ARN. It can later be used to store and retrieve secrets."
}

output "kms_key_id" {
  value       = "${aws_kms_key.credstash-key.*.key_id}"
  description = "KMS Master key id."
}

output "kms_key_alias" {
  value       = "${aws_kms_alias.credstash-key.*.name}"
  description = "KMS Master key alias. It can later be used to store and retrieve secrets."
}

output "kms_key_alias_arn" {
  value       = "${aws_kms_alias.credstash-key.*.arn}"
  description = "KMS Master key alias ARN."
}

output "db_table_arn" {
  value       = "${aws_dynamodb_table.credstash-db.*.arn}"
  description = "DynamoDB table ARN that can be used by credstash to store/retrieve secrets."
}

output "db_table_name" {
  value       = "${aws_dynamodb_table.credstash-db.*.id}"
  description = "DynamoDB table name that can be used by credstash to store/retrieve secrets."
}

//output "reader_policy_arn" {
//  value       = "${aws_iam_policy.reader-policy.*.arn}"
//  description = "Secret Reader policy"
//}
//
//output "writer_policy_arn" {
//  value       = "${aws_iam_policy.credstash-policy.*.arn}"
//  description = "Secret Writer policy"
//}


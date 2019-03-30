data "aws_caller_identity" "current" {}

data "aws_region" "current" {}

data "aws_iam_policy_document" "credstash-reader-policy" {
  "statement" {
    sid = "credstashReaderPolicy"

    actions = [
      "dynamodb:GetItem",
      "dynamodb:Query",
      "dynamodb:Scan",
      "kms:Decrypt",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.db_table_name}",
      "${aws_kms_key.credstash-key.arn}"
    ]
  }
}

data "aws_iam_policy_document" "credstash-writer-policy" {
  "statement" {
    sid = "credstashWriterPolicy"

    actions = [
      "dynamodb:*",
      "kms:*",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:dynamodb:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:table/${var.db_table_name}",
      "${aws_kms_key.credstash-key.arn}"
    ]
  }
}

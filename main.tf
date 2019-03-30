resource "aws_kms_key" "credstash-key" {
  description         = "Default key used by credstash"
  enable_key_rotation = "${var.enable_key_rotation}"
  tags                = "${merge(var.tags, var.kms_tags, map("Name", format("%s", var.kms_key_name)))}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_kms_alias" "credstash-key" {
  name          = "alias/${var.kms_key_name}"
  target_key_id = "${aws_kms_key.credstash-key.key_id}"

  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_dynamodb_table" "credstash-db" {
  name           = "${var.db_table_name}"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "name"
  range_key      = "version"

  attribute {
    name = "name"
    type = "S"
  }

  attribute {
    name = "version"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = "${merge(var.tags, var.dynamodb_tags, map("Name", format("%s", var.db_table_name)))}"
}

resource "aws_iam_policy_attachment" "read-policy-att" {
  name       = "readPolicyAtt"
  policy_arn = "${aws_iam_policy.credstash-policy-reader.arn}"

  users = [
    "${var.read_users}",
  ]

  roles = [
    "${var.read_roles}",
  ]
}

resource "aws_iam_policy_attachment" "write-policy-att" {
  name       = "writePolicyAtt"
  policy_arn = "${aws_iam_policy.credstash-policy-writer.arn}"

  users = [
    "${var.write_users}",
  ]

  roles = [
    "${var.write_roles}",
  ]
}

resource "aws_iam_policy" "credstash-policy-reader" {
  name   = "${var.db_table_name}-reader"
  policy = "${data.aws_iam_policy_document.credstash-reader-policy.json}"
}

resource "aws_iam_policy" "credstash-policy-writer" {
  name   = "${var.db_table_name}-writer"
  policy = "${data.aws_iam_policy_document.credstash-writer-policy.json}"
}

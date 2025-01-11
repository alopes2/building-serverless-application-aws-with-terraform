data "aws_iam_policy_document" "get_data_from_dynamodb" {
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:GetItem"
    ]

    resources = [
      aws_dynamodb_table.data.arn
    ]
  }
}

data "aws_iam_policy_document" "create_data_in_dynamodb" {
  statement {
    effect = "Allow"

    actions = [
      "dynamodb:PutItem"
    ]

    resources = [
      aws_dynamodb_table.data.arn
    ]
  }
}

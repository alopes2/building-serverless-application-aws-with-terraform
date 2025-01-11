resource "aws_lambda_function" "lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = "get-data"
  handler       = "index.handler"
  runtime       = "nodejs22.x"
  role          = aws_iam_role.lambda_role.arn
}

resource "aws_iam_role" "lambda_role" {
  name               = "get-data-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "./lambda_init_code/index.js"
  output_path = "get-data_lambda_function_payload.zip"
}

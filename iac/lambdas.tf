module "get-data-lambda" {
  source  = "./modules/lambda"
  name    = "new-get-data"
  polices = [data.aws_iam_policy_document.get_data_from_dynamodb.json]
  environment_variables = {
    TABLE_NAME = aws_dynamodb_table.data.name
  }
}

module "create-data-lambda" {
  source = "./modules/lambda"
  name   = "create-data"
}

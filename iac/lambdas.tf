module "get-data-lambda" {
  source = "./modules/lambda"
  name   = "new-get-data"
}

module "create-data-lambda" {
  source = "./modules/lambda"
  name   = "create-data"
}

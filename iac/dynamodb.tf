resource "aws_dynamodb_table" "data" {
  name           = "data"
  hash_key       = "ID"
  read_capacity  = 1
  write_capacity = 1
  billing_mode   = "PROVISIONED"

  attribute {
    name = "ID"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "first_data" {
  table_name = aws_dynamodb_table.data.name
  hash_key   = aws_dynamodb_table.data.hash_key
  range_key  = aws_dynamodb_table.data.range_key

  item = jsonencode({
    ID   = { S = "1" }
    Data = { S = "My Super Data" }
  })
}

resource "aws_dynamodb_table_item" "second_data" {
  table_name = aws_dynamodb_table.data.name
  hash_key   = aws_dynamodb_table.data.hash_key
  range_key  = aws_dynamodb_table.data.range_key

  item = jsonencode({
    ID   = { S = "2" }
    Data = { S = "My Second Data" }
  })
}

resource "aws_dynamodb_table_item" "third_data" {
  table_name = aws_dynamodb_table.data.name
  hash_key   = aws_dynamodb_table.data.hash_key
  range_key  = aws_dynamodb_table.data.range_key

  item = jsonencode({
    ID   = { S = "3" }
    Data = { S = "My Third Data" }
  })
}

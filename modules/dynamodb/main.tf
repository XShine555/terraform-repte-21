resource "aws_dynamodb_table" "connections" {
  name         = var.table_name
  billing_mode = var.billing_mode
  hash_key     = "connectionId"

  attribute {
    name = "connectionId"
    type = "S"
  }

  tags = {
    Environment = "dev"
    Project     = "websocket-messaging"
  }
}

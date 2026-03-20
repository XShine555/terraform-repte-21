# DynamoDB module outputs
output "table_name" {
  value = aws_dynamodb_table.connections.name
}

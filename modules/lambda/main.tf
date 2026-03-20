data "archive_file" "websocket_zip" {
  type        = "zip"
  source_file = "${path.module}/src/websocket.py"
  output_path = "${path.module}/src/websocket.zip"
}

resource "aws_lambda_function" "websocket" {
  function_name = "${var.lambda_name_prefix}websocket"
  handler       = "websocket.lambda_handler"
  runtime       = "python3.12"
  role          = var.lab_role_arn
  filename         = data.archive_file.websocket_zip.output_path
  source_code_hash = data.archive_file.websocket_zip.output_base64sha256
  environment {
    variables = {
      TABLE_NAME = var.dynamodb_table_name
    }
  }
}

output "websocket_lambda_arn" {
  value = aws_lambda_function.websocket.arn
}

variable "lambda_name_prefix" {
  description = "Prefijo para los nombres de las funciones Lambda"
  type        = string
  default     = "websocket_"
}

variable "dynamodb_table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
}

variable "lab_role_arn" {
  description = "ARN del rol LabRole para Lambda"
  type        = string
}

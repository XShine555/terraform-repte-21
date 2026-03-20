variable "table_name" {
  description = "Nombre de la tabla DynamoDB"
  type        = string
  default     = "websocket_connections"
}

variable "billing_mode" {
  description = "Modo de facturación de DynamoDB"
  type        = string
  default     = "PAY_PER_REQUEST"
}

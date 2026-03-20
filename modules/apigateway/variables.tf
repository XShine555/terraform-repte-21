variable "lambda_arn" {
  description = "ARN de la Lambda que manejará los eventos WebSocket"
  type        = string
}

variable "lambda_invoke_arn" {
  description = "Invoke ARN de la Lambda para integración API Gateway"
  type        = string
}

variable "stage_name" {
  description = "Nombre del stage de API Gateway"
  type        = string
  default     = "dev"
}

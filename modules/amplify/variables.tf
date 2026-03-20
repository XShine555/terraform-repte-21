variable "websocket_api_url" {
  description = "URL del endpoint WebSocket para el frontend"
  type        = string
}

variable "app_name" {
  description = "Nombre de la app Amplify"
  type        = string
  default     = "websocket-messaging-app"
}

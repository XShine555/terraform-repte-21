
resource "aws_amplify_app" "frontend" {
  name                = var.app_name
  repository          = "https://github.com/XShine555/21-html"
  enable_branch_auto_build = true
  oauth_token         = ""
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = "main"
  framework   = "Web"
  stage       = "PRODUCTION"
  enable_auto_build = true
}

resource "aws_amplify_webhook" "main" {
  app_id      = aws_amplify_app.frontend.id
  branch_name = aws_amplify_branch.main.branch_name
  description = "Webhook for main branch"
}

resource "terraform_data" "trigger_amplify_build" {
  triggers_replace = [
    aws_amplify_webhook.main.id,
    timestamp()
  ]

  provisioner "local-exec" {
    command = "powershell -NoProfile -Command \"Invoke-WebRequest -Method Post -Uri '${aws_amplify_webhook.main.url}' -ContentType 'application/json' -Body '{}' | Out-Null\""
  }

  depends_on = [aws_amplify_webhook.main]
}


output "amplify_app_url" {
  value = aws_amplify_app.frontend.default_domain
}

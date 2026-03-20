module "apigateway" {
  source            = "./modules/apigateway"
  lambda_arn        = module.lambda.websocket_lambda_arn
  lambda_invoke_arn = module.lambda.websocket_lambda_arn
  stage_name        = "dev"
}

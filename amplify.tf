module "amplify" {
  source           = "./modules/amplify"
  websocket_api_url = module.apigateway.websocket_api_endpoint
}

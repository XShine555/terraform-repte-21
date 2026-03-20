variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "us-east-1"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

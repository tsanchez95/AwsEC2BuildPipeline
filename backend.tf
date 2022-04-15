terraform {
  required_version = "~> 0.15.5"
  backend "s3" {
    bucket         = "BUCKET NAME HERE"
    key            = "KEY PATH HERE"
    region         = "us-east-1"
    dynamodb_table = "aws-lock-azuredevops"
    encrypt        = true
  }
}

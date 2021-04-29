# provider.tf

# Specify the provider and access details
provider "aws" {
  /* shared_credentials_file = "$HOME/.aws/credentials" */
  /* profile                 = var.aws_profile */
  region = var.aws_region
}






terraform {
  backend "s3" {
    bucket         = "terraform-state-app-comp-285"
    key            = "global/s3/terraform.tfstate"
    dynamodb_table = "terraform-state-locking"
    region         = "us-east-1"
    encrypt        = true
  }
}
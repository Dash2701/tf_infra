provider "aws" {
  region = "us-east-1"
}




terraform {
  backend "s3" {
    bucket         = "terraform-state-app-comp-285"
    key            = "shared/s3/terraform.tfstate"
    dynamodb_table = "terraform-state-locking"
    region         = "us-east-1"
    encrypt        = true
  }
}
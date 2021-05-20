# provider.tf

# Specify the provider and access details
provider "aws" {
  /* shared_credentials_file = "$HOME/.aws/credentials" */
  /* profile                 = var.aws_profile */
  region = var.aws_region
}





terraform {
  backend "remote" {
    organization = "example-org-e1ade2"

    workspaces {
      name = "getting-started"
    }
  }
}
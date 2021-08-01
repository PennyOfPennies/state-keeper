terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.52"
    }
  }

  backend "s3" {
    bucket         = "penny-thoughts-terraform-state"
    key            = "global/s3/terraform.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }

  required_version = ">= 1.0.3"
}

provider "aws" {
  region = "us-east-2"
}

module "terraform_state_keeper" {
  source              = "github.com/PennyOfPennies/terraform-module-state-keeper"
  bucket_name         = "penny-thoughts-terraform-state"
  dynamodb_table_name = "terraform-state-locks"
}

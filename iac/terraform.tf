terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.23"
    }
  }

  backend "s3" {
    bucket = "terraform-medium-api-notification"
    key    = "building-serverless/state.tfstate"
  }
}

provider "aws" {}

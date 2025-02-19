terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.83"
    }
  }

  backend "s3" {
    bucket = "cloudyflukehomelab"
    key    = "cloudyflukehomelab"
  }
}

provider "aws" {}

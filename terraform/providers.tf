provider "aws" {
  region = "us-east-1"
}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
backend "s3" {
  bucket = "my-terraform-state-1991"
  key    = "dev.tfstate"
  region = "us-east-1"
}
}
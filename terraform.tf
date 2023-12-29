terraform {
  backend "s3" {
    bucket = "uuid-api-terraform-state"
    key    = "dev"
    region = "us-east-1"

    dynamodb_table = "TF-locking"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

}
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
  backend "s3" {
    bucket = "baji-devops-tf-remotestate"
    key    = "provisioners"
    region = "us-east-1"
    # dynamodb_table = "baji-devops-tf-remotestate"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  # Configuration options
}
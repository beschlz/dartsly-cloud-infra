terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket         = "dartsly-tf-store"
    key            = "dartsly-tf-store"
    region         = "eu-central-1"
    dynamodb_table = "dartsly-tf-lock"
    encrypt        = true
  }
}


# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      project = "dartsly"
    }
  }
}

module "backend-setup" {
  source            = "./modules/tf-backend-setup"
  state_bucket_name = "dartsly-tf-store"
  lock_table_name   = "dartsly-tf-lock"
}

module "k3s" {
  source = "./modules/tf-k3s"
}
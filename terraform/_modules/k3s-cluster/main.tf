terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    googleworkspace = {
      source  = "hashicorp/googleworkspace"
      version = "~> 0.7.0"
    }
  }

  required_version = "~> 1.4"
}

provider "googleworkspace" {

}
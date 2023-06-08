terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
    google = {
      source  = "hashicorp/google"
      version = "~> 4.67"
    }
  }

  required_version = "~> 1.4"
}

provider "aws" {
  default_region = "eu-central-1"
  default_tags {
    tags = {
      project = "dartsly"
    }
  }
}

provider "google" {
  project = var.google_project_id
  region  = var.google_project_region
}
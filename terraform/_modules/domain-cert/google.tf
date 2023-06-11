
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.6"
    }
  }
}

provider "google" {
  project = "dartsly"
  region  = "us-central1"
}
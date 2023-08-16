terraform {
  # The configuration for this backend will be filled in by Terragrunt
  required_version = ">= 0.12.18"
  required_providers {
    google = ">= 4.0"
  }
}
backend "gcs" {
    bucket = "test1-data" # need to update with the bucket name
    prefix = "state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}

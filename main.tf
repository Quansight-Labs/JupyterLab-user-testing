terraform {
  backend "remote" {
    organization = "quansight"

    workspaces {
      name = "github-quansight-labs-jupyterlab-user-testing"
    }
  }

  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.54.0"
    }
  }
}


provider "google" {
}

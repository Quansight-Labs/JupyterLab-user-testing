terraform {
  backend "remote" {
    organization = "quansight"

    workspaces {
      name = "github-quansight-labs-jupyterlab-user-testing"
    }
  }

  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.54.0"
    }
  }
}


provider "google" {}



resource "google_compute_instance" "default" {
  name         = "jupyterlab-a11y-testing"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = " ubuntu-2204-jammy-v20230214"
      labels = {
        my_label = "value"
      }
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "curl -L https://tljh.jupyter.org/bootstrap.py | sudo python3 - --admin costrouc"
}

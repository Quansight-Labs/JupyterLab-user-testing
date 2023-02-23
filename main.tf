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

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}


provider "google" {}

provider "cloudflare" {}

resource "google_compute_firewall" "main" {
  name    = "http-firewall"
  network = "default"

  source_ranges = ["0.0.0.0/0"]

  allow {
    protocol = "tcp"
    ports    = ["80", "443"]
  }

  source_tags = ["web"]
}

resource "google_compute_address" "static" {
  name = "ipv4-address"
}

resource "google_compute_instance" "main" {
  name         = "jupyterlab-a11y-testing"
  machine_type = "e2-standard-2"
  zone         = "us-central1-a"

  tags = ["web"]

  boot_disk {
    initialize_params {
      image = " ubuntu-2204-jammy-v20230214"
    }
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = google_compute_address.static.address
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "curl -L https://tljh.jupyter.org/bootstrap.py | sudo python3 - --admin costrouc"
}

data "cloudflare_zone" "main" {
  name = "quansight.dev"
}

resource "cloudflare_record" "main" {
  zone_id = data.cloudflare_zone.main.id
  name    = "jupyter-a11y"
  value   = google_compute_address.static.address
  type    = "A"
  proxied = false
}

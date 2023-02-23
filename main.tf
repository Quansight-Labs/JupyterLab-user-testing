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

provider "google" {
  region = "us-central1"
}

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
      image = "ubuntu-2204-lts"
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


# follow tljh installation instructions
# 0. visit vm gcp page and ssh into instance
# 1. curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin <admin-user-name>
# 2. sudo tljh-config set https.enabled true
# 3. sudo tljh-config set https.letsencrypt.email costrouchov@quansight.com
# 4. sudo tljh-config add-item https.letsencrypt.domains jupyter-a11y.quansight.dev
# 5. sudo tljh-config reload proxy
# 6. login to domain with jupyter-a11y.quansight.dev and set initial password

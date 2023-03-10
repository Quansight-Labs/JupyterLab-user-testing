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
  region = var.region
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
  machine_type = var.instance-type
  zone         = var.zone

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

  metadata_startup_script = <<EOT
curl -L https://tljh.jupyter.org/bootstrap.py | sudo python3 - --admin ${var.admin-username} --user-requirements-txt-url https://raw.githubusercontent.com/Quansight-Labs/JupyterLab-user-testing/main/requirements.txt
sudo tljh-config set https.enabled true
sudo tljh-config set https.letsencrypt.email ${var.letsencrypt-email}
sudo tljh-config add-item https.letsencrypt.domains ${var.subdomain}.${var.domain}
sudo tljh-config reload proxy
sudo tljh-config set user_environment.default_app jupyterlab
sudo tljh-config reload hub
EOT
}

data "cloudflare_zone" "main" {
  name = var.domain
}

resource "cloudflare_record" "main" {
  zone_id = data.cloudflare_zone.main.id
  name    = var.subdomain
  value   = google_compute_address.static.address
  type    = "A"
  proxied = false
}

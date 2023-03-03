variable "region" {
  description = "Region to deploy the resources in"
  default     = "us-central1"
}

variable "zone" {
  description = "Zone to deploy the resources in"
  default     = "us-central1-a"
}

variable "instance-type" {
  description = "GCP instance to deploy TLJH"
  default     = "e2-standard-2"
}

variable "subdomain" {
  description = "Subdomain within Domain/Zone to deploy tljh"
  default     = "jupyter-a11y"
}

variable "domain" {
  description = "Domain/Zone which you have access to via cloudflare"
  default     = "quansight.dev"
}

variable "letsencrypt-email" {
  description = "Email address for let's encrypt to notify renewal of certificate"
  default     = "costrouchov@quansight.com"
}

variable "admin-username" {
  description = "Initial admin username for tljh deployment"
  default     = "costrouc"
}

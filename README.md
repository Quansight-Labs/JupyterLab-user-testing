# JupyterLab-user-testing
Repository containing infrastructure and testing scripts for JupyterLab user testing ✨

## TLJH

Access via `https://jupyter-a11y.quansight.dev`

### Requirements

 - Terraform
 - Google Cloud Platform account
 - Cloudflare account

While this github actions gets credentials via OIDC your method of
authentication will be different. 

See the following for getting credentials:
 - [How to get credentials for GCP](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
 - [How to get credentials for Cloudflare](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)

### Deployment

Currently all infrastructure is deployed via Terraform to Google Cloud
Platform. We deploy an `Ubuntu 22.02 LTS` VM of size `e2-standard-2`
(2 CPU and 8 GB RAM) in the `us-central1-a` region/zone. We use
Cloudflare to point a Quansight owned DNS domain to the GCP
server. When a pull request is opened a `terraform plan` step is run
which checks what resources will be created/destroyed/or updated. On
push to `main` resources are applied via `terraform apply`.

In order to make this setup work for you you will need to modify a few
variables found in [variables.tf](./variables.tf). Once deployment
completes immediately login to domain with `https://<your-domain>`
with username `<admin-user-name>` and set initial password





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

Additional steps since it is hard to fully automate TLJH in terraform:

0. [Visit vm gcp page and ssh into instance](https://console.cloud.google.com/compute/instances)
1. `curl -L https://tljh.jupyter.org/bootstrap.py | sudo -E python3 - --admin <admin-user-name>`
2. `sudo tljh-config set https.enabled true`
3. `sudo tljh-config set https.letsencrypt.email <your-email>`
4. `sudo tljh-config add-item https.letsencrypt.domains <your-domain>`
5. `sudo tljh-config reload proxy`
6. `sudo tljh-config set user_environment.default_app jupyterlab`
7. `sudo tljh-config reload hub`
8. `sudo -E conda install -c conda-forge numpy pandas scipy`
9. login to domain with `https://<your-domain>` with username `<admin-user-name>` and set initial password

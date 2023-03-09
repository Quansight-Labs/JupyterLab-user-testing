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

#### Customizing the Environment

Users can modify the python environment via the
[requirements.txt](./requirements.txt). These requirements will be pip
installed automatically on each new re-deployment.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | 4.54.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.0 |
| <a name="provider_google"></a> [google](#provider\_google) | 4.54.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.main](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [google_compute_address.static](https://registry.terraform.io/providers/hashicorp/google/4.54.0/docs/resources/compute_address) | resource |
| [google_compute_firewall.main](https://registry.terraform.io/providers/hashicorp/google/4.54.0/docs/resources/compute_firewall) | resource |
| [google_compute_instance.main](https://registry.terraform.io/providers/hashicorp/google/4.54.0/docs/resources/compute_instance) | resource |
| [cloudflare_zone.main](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/data-sources/zone) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin-username"></a> [admin-username](#input\_admin-username) | Initial admin username for tljh deployment | `string` | `"costrouc"` | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Domain/Zone which you have access to via cloudflare | `string` | `"quansight.dev"` | no |
| <a name="input_instance-type"></a> [instance-type](#input\_instance-type) | GCP instance to deploy TLJH | `string` | `"e2-standard-2"` | no |
| <a name="input_letsencrypt-email"></a> [letsencrypt-email](#input\_letsencrypt-email) | Email address for let's encrypt to notify renewal of certificate | `string` | `"costrouchov@quansight.com"` | no |
| <a name="input_region"></a> [region](#input\_region) | Region to deploy within | `string` | `"us-central1"` | no |
| <a name="input_subdomain"></a> [subdomain](#input\_subdomain) | Subdomain within Domain/Zone to deploy tljh | `string` | `"jupyter-a11y"` | no |
| <a name="input_zone"></a> [zone](#input\_zone) | Zone to deploy within | `string` | `"us-central1-a"` | no |

## Outputs

No outputs.

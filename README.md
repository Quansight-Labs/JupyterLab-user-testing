# JupyterLab User Testing Environment

Repository containing infrastructure and testing scripts for JupyterLab user testing ✨

- [JupyterLab User Testing Environment](#jupyterlab-user-testing-environment)
  - [Overview 📝](#overview-)
  - [Development and deployment 🏗](#development-and-deployment-)
    - [Pre-requisites](#pre-requisites)
    - [Deployment](#deployment)

## Overview 📝

The environment is based on [The Littlest JupyterHub (TLJH)][TLJH] which is a JupyterHub distribution for a few users (0-100).

For more information about The Littlest JupyterHub, [refer to TLJH's official documentation][TLJH].

The contents of this repository are:

```ascii
.
├── .github - GitHub Actions workflows used to deploy the environment through Terraform
├── notebooks - Notebooks used for user testing
├── `.pre-commit-config.yaml` - Configuration file for pre-commit
└── `main.tf` - Terraform configuration file
```

## Development and deployment 🏗

This section provides information on how to make changes to and deploy the user testing environment.

### Pre-requisites

To use the contents of this repository as is you will need to have the following tools installed:

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli)

As well as:

- A Google Cloud Platform account
- A Cloudflare account

> **Note**:
> You can deploy TLJH on any public cloud provider. We have so far used GCP as our provider of choice, but TLJH in itself is vendor-agnostic.
> Refer to the [TLJH documentation for more details][TLJH].

> **Warning**:
> While the GitHub actions workflows in this repository gets credentials via OIDC (OpenID Connect) you can use a different method to get credentials.

For more information on getting the needed credentials, refer to:

- [How to get credentials for GCP](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
- [How to get credentials for Cloudflare](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)

### Deployment

Currently, all infrastructure is deployed via Terraform to Google Cloud
Platform:

- VM: `Ubuntu 22.02 LTS` of size `e2-standard-2 (2 CPU and 8 GB RAM)
- GCP region: `us-central1-a` region/zone

1. When a pull request is opened a `terraform plan` step is run
which checks what resources will be created/destroyed/or updated. On
push to `main` resources are applied via `terraform apply`.

Note that the GitHub action will only provision the virtual machine, so additional steps are needed:

1. Log into the [Google Cloud Console](https://console.cloud.google.com/) with your Google account.
1. [Connect to your instance through SSH](https://cloud.google.com/compute/docs/instances/ssh)
1. Copy the text below and paste it into the **Startup script** text in the GCP console:

   ```bash
   curl -L https://tljh.jupyter.org/bootstrap.py \
    | sudo -E python3 - \
    --admin <admin-user-name>
   ```

   Where `<admin-user-name>` is your GCP username.
   For more details on what the installer does, refer to the [TLJH documentation: What does the installer do?](https://tljh.jupyter.org/en/latest/topic/installer-actions.html#topic-installer-actions).

Now, you'll need to set up a custom domain at which the environment will be available:

```bash
   # enable HTTPS and setup an email and domain
   sudo tljh-config set https.enabled true
   sudo tljh-config set https.letsencrypt.email <your-email>
   sudo tljh-config add-item https.letsencrypt.domains <your-domain>

   # reload the proxy to apply the changes
   sudo tljh-config reload proxy

   # set the default app to JupyterLab
   sudo tljh-config set user_environment.default_app jupyterlab
   sudo tljh-config reload hub
   sudo -E conda install -c conda-forge numpy pandas scipy
```

1.  login to domain with `https://<your-domain>` with username `<admin-user-name>` and set initial password

<!-- links -->
[TLJH]: https://tljh.jupyter.org/en/latest/index.html

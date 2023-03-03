# JupyterLab User Testing Environment

Repository containing infrastructure and testing scripts for JupyterLab user testing ✨

- [JupyterLab User Testing Environment](#jupyterlab-user-testing-environment)
  - [Overview 📝](#overview-)
  - [Development and deployment 🏗](#development-and-deployment-)
    - [Pre-requisites](#pre-requisites)
    - [Deployment](#deployment)
      - [Provisioning the VM on GCP](#provisioning-the-vm-on-gcp)
      - [Installing TLJH](#installing-tljh)
      - [Setting a DNS and a custom domain](#setting-a-dns-and-a-custom-domain)

## Overview 📝

The environment is based on [The Littlest JupyterHub (TLJH)][TLJH] which is a JupyterHub distribution for a few users (0-100).

For more information about The Littlest JupyterHub, [refer to TLJH's official documentation][TLJH].

The contents of this repository are:

```ascii
.
├── .github - GitHub Actions workflows used to deploy the environment through Terraform
├── notebooks - Notebooks used for user testing (contain the tasks or workflows to be tested)
├── .pre-commit-config.yam - Configuration file for pre-commit hooks
└── main.t - Terraform configuration file
```

## Development and deployment 🏗

This section provides information on how to make changes to and deploy the user testing environment.

### Pre-requisites

To use the contents of this repository as is you will need to have the following tools installed:

- [Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) >= 1.3.7

> **Note**:
> You can deploy TLJH on any public cloud provider. We have so far used GCP as our provider of choice, but TLJH in itself is vendor-agnostic.
> Refer to the [TLJH documentation for more details][TLJH] on how to deploy TLJH on other cloud providers.

Optional requirements - but needed if intending to use the repository contents as-is:

- A Google Cloud Platform account
- A Cloudflare account

> **Warning**:
> While the GitHub actions workflows in this repository gets credentials via OIDC (OpenID Connect) you can use a different method to get credentials.

For more information on getting GCP credentials, refer to:

- [How to get credentials for GCP](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_started)
- [How to get credentials for Cloudflare](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs)

### Deployment

There are three major steps to deploying the testing environment:

1. [Provisioning the virtual machine (VM) on which TLJH will be installed](#provisioning-the-vm-on-gcp)
2. [Installing TLJH on your VM](#installing-tljh)
3. [Final customizations](#setting-a-dns-and-a-custom-domain)

#### Provisioning the VM on GCP

Currently, all infrastructure is deployed via Terraform to GCP. The following resources are created:

- VM: `Ubuntu 22.02 LTS` of size [`e2-standard-2`](https://cloud.google.com/compute/docs/machine-resource#recommendations_for_machine_types) (2 CPU and 8 GB RAM)
- GCP region: `us-central1-a`.

This deployment is handled automatically through the [`.github/workflows/deploy.yaml`](.github/workflows/deploy.yaml) workflow.

- **When a new Pull Request is opened:** `terraform plan` step is run
which checks what resources will be created/destroyed/or updated. And a comment is added to the PR with the corresponding plan.
   ![GitHub PR comment with the Terraform plan](./img/pr-comment.png)
- **On push/merge to `main`:** resources are applied via `terraform apply` and the cloud resources will be created/destroyed/updated accordingly.

#### Installing TLJH

1. Log into the [Google Cloud Console](https://console.cloud.google.com/) with your Google account.
2. [Connect to your instance through SSH](https://cloud.google.com/compute/docs/instances/ssh)
3. Install TLJH - copy the text below and paste it into the **Startup script** text in the GCP console:

   ```bash
      curl -L https://tljh.jupyter.org/bootstrap.py \
       | sudo -E python3 - \
       --admin <admin-user-name>
   ```

   Where `<admin-user-name>` is your GCP username.

   For more details on what the installer does, refer to the [TLJH documentation: What does the installer do?](https://tljh.jupyter.org/en/latest/topic/installer-actions.html#topic-installer-actions).

   > **Warning:**
   > Make sure to read the [Security considerations and suggestions in the TLJH documentation](https://tljh.jupyter.org/en/latest/topic/security.html) before proceeding.
   > In brief: make sure only the GCP resources admin has `sudo` access to the VM and grant the least-privilege access to users and testers.

#### Setting a DNS and a custom domain

1. The first step is to [enable automatic `HTTPS`](https://tljh.jupyter.org/en/latest/howto/admin/https.html#howto-admin-https) with Let's Encrypt:

   ```bash
      sudo tljh-config set https.enabled true
      sudo tljh-config set https.letsencrypt.email <your-email>
      sudo tljh-config add-item https.letsencrypt.domains <your-domain>
   ```

   Where `<your-email>` is your email address and `<your-domain>` is the domain where your hub will be running.

   Once you complete this step, you can check your TLJH configuration

   ```shell
   $ sudo tljh-config show

   #sample output:
   enabled: true
      letsencrypt:
       email: <your-email>
       domains:
       - <your-domain>
   ```

2. You can now reload the proxy to load the new configuration

   ```bash
      sudo tljh-config reload proxy
   ```

   At this point, the proxy should negotiate with Let’s Encrypt to set up a trusted HTTPS certificate for you. It may take a moment for the proxy to negotiate with Let’s Encrypt to get your certificates, after which you can access your Hub securely at `https://<your-domain>`.

3. Finally, we apply some customizations needed:

   ```bash
   # set the default app to JupyterLab
   sudo tljh-config set user_environment.default_app jupyterlab
   # reload the hub to apply the new configuration
   sudo tljh-config reload hub
   # install packages needed for the tests
   sudo -E conda install -c conda-forge numpy pandas scipy
   ```

   > **Note:**
   > For a detailed list of TLJH configuration options, refer to the [TLJH documentation: Customizing the installer](https://tljh.jupyter.org/en/latest/topic/customizing-installer.html).

🚀 You are now ready to start testing! You should now be able to log in to your JupyterHub at `https://<your-domain>` with username `<admin-user-name>` and set an initial password.

<!-- links -->
[TLJH]: https://tljh.jupyter.org/en/latest/index.html

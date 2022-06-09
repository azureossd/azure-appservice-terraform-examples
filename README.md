# azure-appservice-terraform-examples
Various Terraform examples for creating and deploying Azure App Service resources.

```md
# This directory contains an example for creating a Python 3.9 Linux App Service
+-- linux-app-service
|   +-- linux-app-service.tf
# This directory contains an example for creating a Linux Custom Image - Web App for Container
+-- linux-custom-image
|   +-- linux-custom-image.tf
# This directory contains an example for creating a Node 16 Windows App Service
+-- windows-app-service
|    +-- windows-app-service.tf
# This directory contains an example for creating a Windows Container - Web App for Container
+-- windows-custom-image
|    +-- windows-custom-image.tf
```

**Instructions to run:**
1. Download [Terraform](https://www.terraform.io/downloads).
2. Log in with the [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli) and set the appropriate subscription.
3. Run `terraform init`
4. (optional) Run `terraform fmt` to format the `.tf` file if changes are made.
5. Run `terraform apply` to apply and deploy the resources.


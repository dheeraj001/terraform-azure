| **title** | **description** |
|-----------|-----------------|
|Install Terraform, Azure CLI and VSCode Editor|Install all the tools required for learning Terraform on Azure Cloud|
## Step-01: Introduction

- Install [Terraform CLI](https://developer.hashicorp.com/terraform)
- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli)
- Install [VS Code Editor](https://code.visualstudio.com/download)
- Install [HashiCorp Terraform plugin for VS Code](https://marketplace.visualstudio.com/items?itemName=HashiCorp.terraform)
- Install [Git client](https://git-scm.com/downloads)

![Terraform Installation Overview](./image/step1.png)

## Step-01: LinuxOS: Terraform & Azure CLI Install

- [Download Terraform](https://developer.hashicorp.com/terraform)
- [Linux OS Installation](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- Install [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=script)
- Authenticating using the Azure CLI is going to be same for LinuxOS too

<pre>
  # Azure CLI Login 
     az login
  # List Subscriptions
     az account list 
  # Set Specific Subscription (if we have multiple subscriptions) 
     az account set --subscription="SUBSCRIPTION_ID" 
</pre>

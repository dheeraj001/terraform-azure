# Terraform Block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.0"
    }
    null = {
      source = "hashicorp/null"
      version = ">= 3.1.0"
    }  
    time = {
      source = "hashicorp/time"
      version = ">= 0.7.2"
    }    
  }

}
# Provider Block
provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 9
  upper   = false
  special = false
}


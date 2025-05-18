terraform {
  required_version = ">= 1.11.4"
  required_providers {
    azurerm = {
        source = "hashicorp/azurerm"
        version = ">= 1.11.4"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8" 
  }


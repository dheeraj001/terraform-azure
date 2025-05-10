terraform {
  required_version = ">= 1.11.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.28.0"
    }
  }
}

provider "azurerm" {
  features {}  
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}

provider "azurerm" {
  features {
    virtual_machine  {
      delete_os_disk_on_deletion = false
    }
  }
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
  alias = "provider2-westus"
}
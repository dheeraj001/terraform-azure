terraform {
  required_version = ">= 1.11.4"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.7.2"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}

resource "random_string" "mystring" {
  for_each = var.environment
  upper    = false
  length   = 10
  special  = false
}
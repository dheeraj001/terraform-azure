# Terraform Settings Block
terraform {
  required_version = ">= 1.11.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.27.0" # Optional but recommended in production
    }    
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}

# Create Resource Group 
resource "azurerm_resource_group" "my_demo_rg1" {
  location = "eastus"
  name = "my-demo-rg1"  
}
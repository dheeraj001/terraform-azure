#Terrafrom Block

terraform {
  required_version = "~> 1.11.0"
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 4.27.0"
    }
  }

}


#Provider Block
provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}


/*
Play with Terraform CLI Version (We installed 1.0.0 version)
  required_version = "~> 0.14.3" - Will fail
  required_version = "~> 0.14"   - Will fail  
  required_version = "= 0.14.4"  - Will fail
  required_version = ">= 0.13"   - will pass
  required_version = "= 1.0.0"   - will pass
  required_version = "1.0.0"     - will pass 
  required_version = ">= 1.0.0"   - will pass     


Play with Provider Version (as on today latest version is 2.64.0)
      version = "~> 2.0"             
      version = ">= 2.0.0, < 2.60.0"
      version = ">= 2.0.0, <= 2.64.0"     
*/
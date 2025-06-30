provider "azurerm" {
  features {}
  subscription_id = "08607c6d-1d61-4140-a717-47cad9c37fc8"
}

resource "random_string" "myrandom" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage_account" {
  name                = "${var.storage_account_name}${random_string.myrandom.id}"
  resource_group_name = azurerm_resource_group.resource_group.name

  location                 = var.location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type
  account_kind             = var.storage_account_kind

}

resource "azurerm_storage_account_static_website" "static_website" {
  index_document     = var.static_website_index_document
  error_404_document = var.static_website_error_404_document
  storage_account_id = azurerm_storage_account.storage_account.id
}
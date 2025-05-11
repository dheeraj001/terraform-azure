resource "azurerm_resource_group" "myrg" {
  name     = "myrg-01"
  location = "East Us"
}

resource "random_string" "name" {
  length = 16
  special = false
  upper = false
}

resource "azurerm_storage_account" "mysa" {
  name                     = "mysa${random_string.name.id}"
  resource_group_name      = azurerm_resource_group.myrg.name
  location                 = azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "staging"
  }
}
resource "azurerm_resource_group" "myrg" {
    name = "myrg-1"
    location = "eastus"  
}

resource "azurerm_resource_group" "myrg2" {
    name = "myrg-2"
    location = "West US"
    provider = azurerm.provider2-westus
}
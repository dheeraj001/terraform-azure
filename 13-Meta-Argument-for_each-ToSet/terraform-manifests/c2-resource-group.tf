resource "azurerm_resource_group" "myrg" {
    for_each = toset([ "eastus", "eastus2", "westus" ])
    name = "myrg-${each.key}"
    location = each.value
  
}
resource "azurerm_resource_group" "myrg" {
    for_each = {
      dc1app1 = "eastus"
      dc2app2 = "eastus2"
      dc3app3 = "westus"
    }
    name = "myrg-${each.key}"
    location = each.value
  
}
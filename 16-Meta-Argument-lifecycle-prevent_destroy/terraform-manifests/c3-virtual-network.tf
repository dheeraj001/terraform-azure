resource "azurerm_virtual_network" "myvnet" {
  name                = "myvnet-01"
  location            = azurerm_resource_group.myrg.location
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.myrg.name
  /*lifecycle {
    prevent_destroy = true
  }*/

}
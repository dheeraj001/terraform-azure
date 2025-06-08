data "azurerm_virtual_network" "vnet-ds" {
    name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.myrg.name  
}

output "ds-vnet-name" {
   value = data.azurerm_virtual_network.vnet-ds.name
  
}
output "ds-vnet-id" {
    value = data.azurerm_virtual_network.vnet-ds.id
}
output "ds-vnet-address_space" {
    value = data.azurerm_virtual_network.vnet-ds.address_space
  
}
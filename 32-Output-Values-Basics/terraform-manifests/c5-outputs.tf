output "resource_group_id" {
  description = "Resource group id"
  value       = azurerm_resource_group.myrg.id
}

output "resource_group_name" {
  description = "Resource group name"
  value       = azurerm_resource_group.myrg.name
}

output "virtual_network_name" {
  description = "Virtual N/W name"
  value       = azurerm_virtual_network.myvnet.name

}
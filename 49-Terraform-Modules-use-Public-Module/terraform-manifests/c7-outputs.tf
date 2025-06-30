# 1. Output Values - Resource Group
output "resource_group_id" {
  description = "Resource Group ID"
  # Atrribute Reference
  value = azurerm_resource_group.myrg.id
}
output "resource_group_name" {
  description = "Resource Group name"
  # Argument Reference
  value = azurerm_resource_group.myrg.name
}


output "virtual_network_name" {
  description = "Virtual Network Name"
  value       = module.vnet.vnet_name
}

output "virtual_network_subnets" {
  description = "Virtual Network Subnets"
  value       = module.vnet.vnet_subnets
}

output "virtual_network_id" {
  description = "Virtual Network ID"
  value       = module.vnet.vnet_id
}

output "virtual_network_location" {
  description = "Virtual Network Location"
  value       = module.vnet.vnet_location
}

output "virtual_network_address_space" {
  description = "Virtual network address space"
  value       = module.vnet.vnet_address_space
}
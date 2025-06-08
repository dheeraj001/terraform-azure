# Create Virtual Network
resource "azurerm_virtual_network" "myvnet" {
  #   name                = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"
  name = local.vnet_name
  # address_space       = ["10.0.0.0/16"]
  address_space       = local.vnet_address_space
  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags                = local.common_tags
}

# Create Virtual Network Using condition Expression in Resouce
resource "azurerm_virtual_network" "myvnet2" {
  count = var.environment == "dev" ? 1 : 5
  name  = "${var.business_unit}-${var.environment}-${var.virtual_network_name}-${count.index}"

  address_space = ["10.0.0.0/16"]

  location            = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  tags                = local.common_tags
}
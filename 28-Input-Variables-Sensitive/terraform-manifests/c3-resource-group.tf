# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  #name = var.resource_group_name
  name = "${var.business_unit}-${var.Environment}-${var.resource_group_name}"
  location = var.resource_group_location
  tags = var.common_tags
}
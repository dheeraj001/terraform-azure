resource "azurerm_resource_group" "myrg" {
  name     = "${var.business_unit}-${var.Environment}-${var.resource_group_name}-01"
  location = var.resource_group_location
  tags     = var.common_tags
}
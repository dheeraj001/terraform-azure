# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "myrg" {
  #   name = "${var.business_unit}-${var.environment}-${var.resoure_group_name}"
  name     = local.rg_name
  location = var.resoure_group_location
  tags     = local.common_tags
}
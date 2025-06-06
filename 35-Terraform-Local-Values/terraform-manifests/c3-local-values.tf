locals {
  rg_name   = "${var.business_unit}-${var.environment}-${var.resoure_group_name}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.virtual_network_name}"

  service_name = "Demo Service"
  owner        = "Dheeraj Negi"
  common_tags = {
    Service = local.service_name
    Owner   = local.owner
  }
}
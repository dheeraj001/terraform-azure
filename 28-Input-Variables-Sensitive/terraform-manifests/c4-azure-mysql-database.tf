resource "azurerm_mysql_flexible_server" "mysqlserver" {
  name                   = "${var.business_unit}-${var.Environment}-${var.db_name}" 
  location               = azurerm_resource_group.myrg.location
  resource_group_name    = azurerm_resource_group.myrg.name
  administrator_login    = var.db_username
  administrator_password = var.db_password
  sku_name               = "GP_Standard_D2ds_v4"
  version                = "8.0.21"
  zone                   = "1"
  backup_retention_days  = 7
  
  geo_redundant_backup_enabled      = false

 
  tags = var.common_tags
}

resource "azurerm_mysql_flexible_database" "webappdb1" {
  name                = "webappdb1"
  resource_group_name = azurerm_resource_group.myrg.name
  server_name         = azurerm_mysql_flexible_server.mysqlserver.name
  charset             = "utf8"
  collation           = "utf8_unicode_ci"
}
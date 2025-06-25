resource "azurerm_resource_group" "myrg" {
  name     = "myrg-1"
  location = "eastus"
  tags = {
    "Tag1" = "My_Test_Tag"
  }
}
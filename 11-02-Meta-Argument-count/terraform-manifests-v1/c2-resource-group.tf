resource "azurerm_resource_group" "myrg" {
    count = 3
    name = "myrg-${count.index}"
    location = "East Us"
}
resource "azurerm_virtual_network" "myvnet" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-${var.virtual_network_name}"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = azurerm_resource_group.myrg[each.key].name
  location            = azurerm_resource_group.myrg[each.key].location
}

resource "azurerm_subnet" "mysubnet" {
  for_each             = var.environment
  name                 = "${var.business_unit}-${each.key}-mysubnet"
  resource_group_name  = azurerm_resource_group.myrg[each.key].name
  virtual_network_name = azurerm_virtual_network.myvnet[each.key].name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "mypublicip" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-mypublicip"
  resource_group_name = azurerm_resource_group.myrg[each.key].name
  location            = azurerm_resource_group.myrg[each.key].location
  allocation_method   = "Static"
  domain_name_label   = "app-vm-${each.key}-${random_string.mystring[each.key].id}"
}

resource "azurerm_network_interface" "myvmnic" {
  for_each            = var.environment
  name                = "${var.business_unit}-${each.key}-mynic"
  resource_group_name = azurerm_resource_group.myrg[each.key].name
  location            = azurerm_resource_group.myrg[each.key].location
  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
    subnet_id                     = azurerm_subnet.mysubnet[each.key].id
    public_ip_address_id          = azurerm_public_ip.mypublicip[each.key].id
  }

}
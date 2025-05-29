resource "azurerm_virtual_network" "myvnet" {
  name = "${var.business_unit}-${var.virtual_network_name}-01"
  # address_space       = ["10.0.0.0/16"]
  address_space = var.virtual_network_address_space
  # address_space       = [var.virtual_network_address_space[0]]
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  tags                = var.common_tags
}

resource "azurerm_subnet" "mysubnet" {
  #   name                 = "mysubnet-01"
  #   name                 = var.virtual_subnet
  #   name = "${var.business_unit}-${var.virtual_network_name}-01-${var.virtual_subnet}"
  name                 = "${azurerm_virtual_network.myvnet.name}-${var.virtual_subnet}"
  address_prefixes     = ["10.3.1.0/24"]
  resource_group_name  = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name

}

resource "azurerm_public_ip" "mypublicip" {
  name                = "mypublicip-01"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location
  allocation_method   = "Static"
  domain_name_label   = "myvm-ip-${random_string.mystring.id}"
  # sku = var.public_ip_sku["eastus2"]
  sku  = lookup(var.public_ip_sku, var.resource_group_location, "Basic")
  tags = var.common_tags
}

resource "azurerm_network_interface" "mynic" {
  name                = "mynic-01"
  resource_group_name = azurerm_resource_group.myrg.name
  location            = azurerm_resource_group.myrg.location

  ip_configuration {

    name                          = "internal"
    subnet_id                     = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.mypublicip.id
  }
  tags = var.common_tags
}
resource "azurerm_virtual_network" "mynet" {
    name = "mynet-01"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet-01"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.mynet.name
    address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "myip" {
    name = "myip-01"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    allocation_method = "Dynamic"
    domain_name_label = "myapp-${random_string.mystring.id}"
}

resource "azurerm_network_interface" "mynic" {
    name = "mynic-01"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name

    ip_configuration {
        name = "myipconfig-01"
        subnet_id = azurerm_subnet.mysubnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.myip.id
    }
}


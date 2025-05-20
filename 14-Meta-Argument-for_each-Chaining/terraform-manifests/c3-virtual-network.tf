resource "azurerm_virtual_network" "myvnet" {
    name = "myvent-01"
    address_space = [ "10.0.0.0/16" ]
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
}

resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet-01"
    address_prefixes = [ "10.0.1.0/24" ]
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
}

resource "azurerm_public_ip" "mypublicip" {
    for_each = toset([ "vm1", "vm2" ])
    name = "mypublicip-${each.value}"
    allocation_method = "Static"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    domain_name_label = "myapp-${each.value}-${random_string.mystring.id}"
}

resource "azurerm_network_interface" "mynic" {
    for_each = toset([ "vm1", "vm2" ])
    name = "mynic-${each.value}"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.mysubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.mypublicip[each.value].id
    }
  
}
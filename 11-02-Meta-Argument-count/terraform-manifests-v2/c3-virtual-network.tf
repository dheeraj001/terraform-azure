resource "azurerm_virtual_network" "myvnet" {
    name = "myvent-01"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet-01"
    address_prefixes = [ "10.0.1.0/24" ]
    virtual_network_name = azurerm_virtual_network.myvnet.name
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_public_ip" "mypublicip" {
    count = 2 
    name = "mypublicip-${count.index}"
    allocation_method = "Static"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    domain_name_label = "my-appvm-${count.index}-${random_string.mystr.id}"
}

resource "azurerm_network_interface" "myvnic" {
  count = 2  
  name = "myvnic-${count.index}"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = element(azurerm_public_ip.mypublicip[*].id , count.index)

  }
}
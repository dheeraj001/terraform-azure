resource "azurerm_virtual_network" "myvnet" {
    name = "myvnet-01"
    address_space = [ "10.0.0.0/16" ]
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
}

resource "azurerm_subnet" "mysubnet" {
  name = "mysubnet-01"
  address_prefixes = [ "10.0.1.0/24" ]
  resource_group_name = azurerm_resource_group.myrg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
}

resource "azurerm_public_ip" "myip" {
  depends_on = [
     azurerm_virtual_network.myvnet,
     azurerm_subnet.mysubnet         
   ]

  name = "myip-01"
  resource_group_name = azurerm_resource_group.myrg.name
  location = azurerm_resource_group.myrg.location
  allocation_method = "Static"
  domain_name_label = "app-vm1-${random_string.mystr.id}"

}

resource "azurerm_network_interface" "myvmnic" {

  name = "myvmnic-01"
  location = azurerm_resource_group.myrg.location
  resource_group_name = azurerm_resource_group.myrg.name
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.mysubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.myip.id
  }
}
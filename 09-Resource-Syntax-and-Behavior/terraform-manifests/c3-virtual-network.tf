resource "azurerm_virtual_network" "myvet" {
    name = "myvet-01"
    address_space = ["10.0.0.0/16"]
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    tags = {
      "Name" = "myvet-01"
      Enviorment = "Dev"
    }    
}

resource "azurerm_subnet" "mysubnet" {
    name = "mysubnet-01"
    resource_group_name = azurerm_resource_group.myrg.name
    virtual_network_name = azurerm_virtual_network.myvet.name
    address_prefixes = ["10.0.2.0/24"]
}

resource "azurerm_public_ip" "mypublicip" {
    name = "mypublicip-01"
    location = azurerm_resource_group.myrg.location
    resource_group_name = azurerm_resource_group.myrg.name
    allocation_method = "Static"
    tags = {
      enviorment = "stage"
    }
}

resource "azurerm_network_interface" "mynic" {
   name = "mynic-02"
   location = azurerm_resource_group.myrg.location
   resource_group_name = azurerm_resource_group.myrg.name
   ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.mysubnet.id
      private_ip_address_allocation = "Dynamic"
      public_ip_address_id = azurerm_public_ip.mypublicip.id
   }
}



resource "azurerm_linux_virtual_machine" "myvm" {
    count = 2
    name = "myvm-${count.index}"   
    computer_name = "devops${count.index}"
    resource_group_name = azurerm_resource_group.myrg.name
    location = azurerm_resource_group.myrg.location
    size = "Standard_DS1_v2"
    admin_username = "dheeraj"
    network_interface_ids = [ 
        element(azurerm_network_interface.myvnic[*].id, count.index)
    ]
    admin_ssh_key {
      username = "dheeraj"
      public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    }
    os_disk {
        name = "osdisk-${count.index}"
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    source_image_reference {
      publisher = "Redhat"
      offer = "RHEL"
      sku = "86-gen2"
      version = "latest"
    }
    custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")
}
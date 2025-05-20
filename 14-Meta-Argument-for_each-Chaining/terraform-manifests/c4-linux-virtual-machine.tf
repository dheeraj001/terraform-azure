resource "azurerm_linux_virtual_machine" "mylinuxvm" {
    for_each = azurerm_network_interface.mynic
    name = "mylinuxvm-${each.key}"
    computer_name = "mydevops-${each.key}"
    resource_group_name = azurerm_resource_group.myrg.name
    location            = azurerm_resource_group.myrg.location
    size                = "Standard_DS1_v2"
    admin_username      = "dheeraj"   
    network_interface_ids = [ azurerm_network_interface.mynic[each.key].id ]
    admin_ssh_key {
      username = "dheeraj"
      public_key = file("${path.module}/ssh-keys/terraform-azure.pub")
    }
    os_disk {
      name = "osdisk${each.key}"
      caching = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
      publisher = "RedHat"
      offer     = "RHEL"
      sku       = "83-gen2"
      version   = "latest"
    }
    custom_data = filebase64("${path.module}/app-scripts/app1-cloud-init.txt")

}
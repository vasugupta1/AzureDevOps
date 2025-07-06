/*10.0.0.0 is the starting ip address
16 indicates the subnet mask, meaning the network includes IP's from 10.0.0.0 to 10.0.255.255 ie 65.536 poissble addresses
we will divide these possible Ip address into further subnets
*/

resource "azurerm_virtual_network" "linux_vm_network" {
    name = "samplevmnetwork"
    address_space = ["10.0.0.0/16"]
    location = var.location
    resource_group_name = var.resouce_group_name
}

/*
we will divide these possible Ip address into further subnets
a subnet is a smaller network inside a Vnet
You want to divide a large Ip address into further subnets in order to 
1.first organise resouces by groups
2. Apply network policies to specific subnets
3. Control traffice flow by restricting traffic between subnets
*/

resource "azurerm_subnet" "linux_vm_subnet" {
    name = "linuxvmsubnet1"
    resource_group_name = var.resouce_group_name
    virtual_network_name = azurerm_virtual_network.linux_vm_network.name
    address_prefixes = ["10.0.1.0/24"]
}

# resource "azurerm_subnet" "linux_vm_subnet" {
#     name = "linuxvmsubnet2"
#     resource_group_name = var.resouce_group_name
#     virtual_network_name = azurerm_virtual_network.linux_vm_network.name
#     address_prefixes = ["10.0.2.0/24"]
# }

# resource "azurerm_subnet" "linux_vm_subnet" {
#     name = "linuxvmsubnet3"
#     resource_group_name = var.resouce_group_name
#     virtual_network_name = azurerm_virtual_network.linux_vm_network.name
#     address_prefixes = ["10.0.3.0/24"]
# }

resource "azurerm_network_interface" "linux_vm_ni" {
    name = "linuxvmni"
    location = var.location
    resource_group_name = var.resouce_group_name
    ip_configuration {
      name = "internal"
      subnet_id = azurerm_subnet.linux_vm_subnet.id
      private_ip_address_allocation = "Dynamic"
    }
}

resource "azurerm_linux_virtual_machine" "linux_vm" {
    name = var.vm_name
    resource_group_name = var.resouce_group_name
    location = var.location
    size = "Standard_F2"
    admin_username = "adminuser"
    admin_password = "Password123."
    disable_password_authentication = false
    network_interface_ids = [azurerm_network_interface.linux_vm_ni.id]
    os_disk {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}

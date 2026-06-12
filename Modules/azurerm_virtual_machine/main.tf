data "azurerm_network_interface" "nic01" {
    for_each = var.vm01
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name

}
resource "azurerm_linux_virtual_machine" "vm01" {
    for_each = var.vm01
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    data.azurerm_network_interface.nic01[each.key].id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
}
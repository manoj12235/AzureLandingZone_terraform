module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rg1    = var.rg1
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_virtual_network"
  vnet1      = var.vnet1
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../Modules/azurerm_subnet"
  subnet1    = var.subnet1
}

module "azurerm_network_interface" {
  depends_on = [module.azurerm_subnet]
  source     = "../../Modules/azurerm_network_interface"
  nic1       = var.nic1
}

module "azurerm_virtual_machine" {
  depends_on = [module.azurerm_network_interface]
  source     = "../../Modules/azurerm_virtual_machine"
  vm01       = var.vm01
}

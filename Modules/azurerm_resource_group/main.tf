resource "azurerm_resource_group" "rg1"{

    for_each = var.rg1
    name     = each.value.resource_group_name
    location = each.value.location

}
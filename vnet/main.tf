resource "azurerm_virtual_network" "rg-prady"{
for_each = var.vnet
    name = each.key
    location = each.value.location
    resource_group_name = each.value.rg
    address_space = each.value.address
    
}
resource "azurerm_subnet" "rg-prady"{
for_each = var.subnet

    name = each.key
    resource_group_name = each.value.rg
    virtual_network_name = each.value.vnet
    address_prefixes = each.value.prefix
    
}
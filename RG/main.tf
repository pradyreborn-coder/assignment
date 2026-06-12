resource "azurerm_resource_group" "rg-prady"{
for_each = var.rg
    name = each.key
    location = each.value
    
}
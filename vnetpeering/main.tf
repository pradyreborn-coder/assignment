resource "azurerm_virtual_network_peering" "peer-1" {

    for_each = var.peer
  name                      = each.key
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.virtual_network_name
  remote_virtual_network_id = each.value.remote_virtual_network_id
}

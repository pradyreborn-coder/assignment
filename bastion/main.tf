resource "azurerm_public_ip" "pip-prady" {
for_each = var.pip
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.rg  
  allocation_method   = "Static"
  sku                 = "Standard"
  
}

resource "azurerm_bastion_host" "rg-prady"{
for_each = var.bastion
  name                = each.key
  location            = each.value.location
  resource_group_name = each.value.rg

  ip_configuration {
    name                 = "internal"
    subnet_id            = data.azurerm_subnet.bastion.id
    public_ip_address_id = azurerm_public_ip.pip-prady[each.value.pip].id
  }
}

data "azurerm_subnet" "bastion" {
  name                 = "AzureBastionSubnet"
  virtual_network_name = "vnet-prady-2"
  resource_group_name  = "prady-rg1"
}
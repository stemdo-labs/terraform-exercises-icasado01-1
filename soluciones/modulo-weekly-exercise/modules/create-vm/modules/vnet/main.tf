
resource "azurerm_virtual_network" "vnet_weekly" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.vnet_location
  address_space       = var.vnet_address_space
  tags                = {
  environment_tag = var.environment_tag
  }
}
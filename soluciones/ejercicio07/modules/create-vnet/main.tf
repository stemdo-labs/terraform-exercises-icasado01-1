# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "3.0.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }


resource "azurerm_virtual_network" "vnet_icasado" {
  name                = var.vnet_name
  resource_group_name = var.existent_resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = local.tags
}

module "create-subnets" {
  depends_on = [ azurerm_virtual_network.vnet_icasado ]
  source = "./modules/create-subnets"
  subnet_names = var.subnet_names
  existent_resource_group_name = var.existent_resource_group_name
  vnet_name = var.vnet_name
}


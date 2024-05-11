terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.103.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet_weekly" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
  location            = var.vnet_location
  address_space       = var.vnet_address_space
  tags                = {
  environment_tag = var.environment_tag
  }
}

module "create-subnets" {
  depends_on = [ azurerm_virtual_network.vnet_weekly ]
  for_each = var.subnets
  source = "./modules/create-subnets"
  subnet_name = each.key
  address_prefixes = each.value["subnet_address_prefixes"]
  vnet_name = var.vnet_name
  resource_group_name = var.resource_group_name
}


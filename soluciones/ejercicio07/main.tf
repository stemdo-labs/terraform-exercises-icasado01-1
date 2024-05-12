terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "create-vnet" {
  source                       = "./modules/create-vnet"
  existent_resource_group_name = var.existent_resource_group_name
  vnet_name                    = var.vnet_name
  vnet_address_space           = ["10.0.0.0/16"]
  owner_tag                    = var.owner_tag
  environment_tag              = var.environment_tag
  vnet_tags                    = local.tags
  subnet_names = ["subnet-a","subnet-b"]
}
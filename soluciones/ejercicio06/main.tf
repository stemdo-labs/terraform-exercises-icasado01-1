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

module "ejercicio04" {
    source                       = "github.com/stemdo-labs/terraform-exercises-icasado01-1/soluciones/ejercicio05/modules/ejercicio04"
    existent_resource_group_name = var.existent_resource_group_name
    vnet_name                    = var.vnet_name
    vnet_address_space           = var.vnet_address_space
    owner_tag                    = "icasado"
    environment_tag              = "DEV"
    vnet_tags = {
        "owner" = "icasado"
    }
}

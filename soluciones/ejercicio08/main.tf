terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.0.0"
    }
  }
  backend "azurerm"{
      resource_group_name  = "rg1icasado-lab01"
      storage_account_name = "sta1icasado"
      container_name       = "icasadocontainertfstate"
      key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_virtual_network" "vnet_icasado" {
  name                = var.vnet_name
  resource_group_name = var.existent_resource_group_name
  location            = var.location
  address_space       = var.vnet_address_space
  tags                = local.tags
}
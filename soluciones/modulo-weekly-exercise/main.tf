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


module "create-vm" {
  source                = "./modules/create-vm"
  resource_group        = var.resource_group
  location              = var.location 
  vnet_name             = var.vnet_name
  subnets               = var.subnets
  vnet_address_space    = var.vnet_address_space
  owner_tag             = var.owner_tag
  environment_tag       = var.environment_tag
  virtual_machine       = var.virtual_machine
}   

module "create-lb" {
  source                = "./modules/create-lb"
  resource_group        = var.resource_group
  location              = var.location 
  vnet_name             = var.vnet_name
  subnets               = var.subnets
  vnet_address_space    = var.vnet_address_space
  owner_tag             = var.owner_tag
  environment_tag       = var.environment_tag
  virtual_machine       = var.virtual_machine
  load_balancer_name    = var.load_balancer_name 
  
}
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

## CREAR VNET Y SUBNETS

module "create-network" {
  source              = "./modules/create-network"
  vnet_name           = var.vnet_name
  resource_group_name = var.resource_group
  vnet_location       = var.vnet_location
  vnet_address_space  = var.vnet_address_space
  subnets             = var.subnets
  owner_tag           = var.owner_tag
  environment_tag     = var.environment_tag
}

## CREAR INTERFACES DE RED

resource "azurerm_network_interface" "nic" {
  depends_on = [ module.create-network ]
  for_each            = var.virtual_machine
  name                = "${each.key}-nic"
  location            = each.value.location
  resource_group_name = var.resource_group

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  module.create-network.subnet_id[0]
    private_ip_address_allocation = "Dynamic"
  }
}

## CREAR MÁQUINAS VIRTUALES

resource "azurerm_linux_virtual_machine" "vms" {
  depends_on              = [ azurerm_network_interface.nic ]
  for_each                = var.virtual_machine
  name                    = each.key
  location                = each.value.location
  resource_group_name     = var.resource_group
  admin_username          = each.value.username
  admin_password          = each.value.password
  size                    = each.value.vm_size
  disable_password_authentication = false
  network_interface_ids   = [
    azurerm_network_interface.nic[each.key].id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
    source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}



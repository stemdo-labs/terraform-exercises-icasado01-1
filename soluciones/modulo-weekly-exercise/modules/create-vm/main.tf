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

module "vnet" {
  source = "./modules/vnet/"
  resource_group_name = var.resource_group_name
  vnet_name = var.vnet_name
  vnet_address_space = var.vnet_address_space
  environment_tag = var.environment_tag
  owner_tag = var.owner_tag
}

module "subnets" {
  depends_on = [ module.vnet ]
  source = "./modules/subnets" 
  for_each = var.subnets
  subnet_name = each.key
  address_prefixes = each.value["subnet_address_prefixes"]
  vnet_name = var.vnet_name
  resource_group_name = var.resource_group_name
}
## CREAR INTERFACES DE RED

resource "azurerm_network_interface" "nic" {
  depends_on = [ module.vnet ]
  for_each            = var.virtual_machine
  name                = "${each.key}-nic"
  location            = each.value.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     =  module.subnets["subnet-a"].subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

## CREAR MÁQUINAS VIRTUALES

resource "azurerm_linux_virtual_machine" "vms" {
  depends_on              = [ azurerm_network_interface.nic ]
  for_each                = var.virtual_machine
  name                    = each.key
  location                = each.value.location
  resource_group_name     = var.resource_group_name
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

resource "azurerm_lb" "my_lb"{
  name = var.load_balancer_name
  location = var.location
  resource_group_name = var.resource_group_name
  sku = "Standard"

  frontend_ip_configuration {
    name = "frontend-ip"
    subnet_id = module.subnets["subnet-a"].subnet_id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "my_lb_pool" {
  depends_on = [ azurerm_lb.my_lb ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-pool"
}

resource "azurerm_lb_probe" "my_lb_probe" {
  depends_on = [ azurerm_lb.my_lb ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-probe"
  port = 80
}

resource "azurerm_lb_rule" "my_lb_rule" {
  depends_on = [ azurerm_lb_probe.my_lb_probe, azurerm_lb_backend_address_pool.my_lb_pool ]
  loadbalancer_id = azurerm_lb.my_lb.id
  name = "test-rule"
  protocol = "Tcp"
  frontend_port = 80
  backend_port = 80
  disable_outbound_snat = true
  frontend_ip_configuration_name = "frontend-ip"
  probe_id = azurerm_lb_probe.my_lb_probe.id
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.my_lb_pool.id]
}
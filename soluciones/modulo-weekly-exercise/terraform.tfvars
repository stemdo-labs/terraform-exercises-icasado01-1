resource_group               = "rg1icasado-lab01"
location = "West Europe"
# VNET

vnet_name                    = "vnet_weekly"
vnet_address_space           = [ "10.0.0.0/16" ]
owner_tag                    = "icasado"
environment_tag              = "DEV"

# SUBNETS

subnets = {
  "subnet-a" = {
    subnet_address_prefixes = ["10.0.0.0/24"]
  }
  "subnet-b" = {
    subnet_address_prefixes = ["10.0.1.0/24"]
  }
}

# VMs

virtual_machine = {
  "vm-a" = {
    location = "West Europe",
    vm_size = "Standard_F2",
    username = "nacho"
    password = "Nc1234*"
    network_interface_ids = 0
  }
  "vm-b" = {
    location = "West Europe",
    vm_size = "Standard_F2",
    username = "nacho"
    password = "Nc1234*"
    network_interface_ids = 1
  }
}

# LOAD BALANCER

load_balancer_name = "my_lb"

# GRUPO DE RECURSOS

variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type = string
}

variable "location" {
  description = "Localización"
  type = string
}

# VNET VARS

variable "vnet_name" {
  type        = string
  description = "Nombre de la Vnet"
  nullable    = false
}

variable "vnet_address_space" {
  type        = list(any)
  description = "Direccion de la Vnet"
}

variable "vnet_location" {
  type        = string
  default     = "West Europe"
}

variable "owner_tag" {
  type        = string
  description = "Propietario de la Vnet"
  nullable    = false
}

variable "environment_tag" {
  type        = string
  description = "Entorno de la Vnet"
  nullable    = false
}

## SUBNET VARS

variable "subnets" {
  type = map(object({
    subnet_address_prefixes = list(string)
  }))
}

# VIRTUAL MACHINES

variable "virtual_machine" {
  type = map(object({
    location          = string
    vm_size           = string
    username          = string
    password          = string
  }))
}

# LOAD BALANCER

variable "load_balancer_name" {
  type = string
}


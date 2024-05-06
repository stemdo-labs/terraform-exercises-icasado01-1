variable "existent_resource_group_name" {
    type = string
  description = "Nombre del grupo de recursos"
}

variable "vnet_name" {
    type = string
  description = "Nombre de la Vnet"
}

variable "vnet_address_space" {
    type = list
  description = "Direccion de la Vnet"
}

variable "location" {
    type = string
    default = "West Europe"
}
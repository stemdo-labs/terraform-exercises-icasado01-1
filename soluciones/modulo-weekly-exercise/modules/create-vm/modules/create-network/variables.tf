variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
}

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

variable "subnets" {
  type = map(object({
    subnet_address_prefixes = list(string)
  }))
}
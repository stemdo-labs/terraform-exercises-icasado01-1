variable "existent_resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la Vnet"
  nullable   = false
}

variable "vnet_address_space" {
  type        = list(any)
  description = "Direccion de la Vnet"
}

variable "location" {
  type    = string
  default = "West Europe"
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

variable "vnet_tags" {
  type        = map(string)
  default     = {}
  description = "Tags adicionales de la Vnet"
  nullable    = false
}
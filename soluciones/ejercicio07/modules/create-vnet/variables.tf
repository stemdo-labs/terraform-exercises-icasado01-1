variable "existent_resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la Vnet"
  nullable   = false
  validation {
    condition = startswith(var.vnet_name, "vnet") && endswith(var.vnet_name ,join("", ["tfexercise",(regex("[0-9]{2}" , var.vnet_name))]))
    error_message = "El nombre de la vnet debe empezar por 'vnet' y acabar 'tfexercise' seguido de dos dígitos"
  }
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
  validation {
    condition = contains(["dev","pro","test","pre"], lower(var.environment_tag))
    error_message = "Valores aceptados: dev, pro, test, pre"
  }
}

variable "vnet_tags" {
  type        = map(string)
  default     = {}
  description = "Tags adicionales de la Vnet"
  nullable    = false
}

variable "subnet_names" {
  type = list(string)
  default = [ "" ]
  nullable = false
}
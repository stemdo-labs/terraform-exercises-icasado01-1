variable "resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la Vnet"
  nullable   = false
}

variable "subnet_name" {
  type = string
}

variable "address_prefixes"{
  type = list(string)
}
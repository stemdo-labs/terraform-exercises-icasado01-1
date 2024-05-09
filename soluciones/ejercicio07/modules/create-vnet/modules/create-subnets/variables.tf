variable "existent_resource_group_name" {
  type        = string
  description = "Nombre del grupo de recursos"
}

variable "vnet_name" {
  type        = string
  description = "Nombre de la Vnet"
  nullable   = false
}

variable "subnet_names"{
    type = list(string)
    description = "Nombre de la subnet"
    nullable = false
}

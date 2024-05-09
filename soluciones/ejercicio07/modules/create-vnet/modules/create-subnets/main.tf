# variable "subnet_names" {
#   description = "Lista de nombres para las subredes"
#   type        = list(string)
# }

# variable "vnet_name" {
#   description = "Nombre de la red virtual existente"
#   type        = string
# }

# variable "existent.resource_group_name" {
#   description = "Nombre del grupo de recursos existente"
#   type        = string
# }


resource "azurerm_subnet" "subnets" {
  count                    = length(var.subnet_names)
  name                     = var.subnet_names[count.index]
  resource_group_name      = var.existent_resource_group_name
  virtual_network_name     = var.vnet_name
  address_prefixes         = ["10.0.${count.index}.0/24"]
}

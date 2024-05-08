locals {
  tags = merge(
    {
      "owner"       = var.owner_tag,
      "environment" = var.environment_tag
    },
    var.vnet_tags
  )
}
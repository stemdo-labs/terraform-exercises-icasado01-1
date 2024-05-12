output "subnet_id" {
  value = values(module.subnets)[0].subnet_id
}
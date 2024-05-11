output "subnet_id" {
  value = values(module.create-subnets)[*].subnet_id
}
output "vpc_id" {
  value = module.vpc_common.vpc_id
}

output "public_subnets_ids" {
  value = module.vpc_common.public_subnets
}

output "private_subnets_ids" {
  value = module.vpc_common.private_subnets
}
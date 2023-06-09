module "policies" {
  source = "./policies"
}

output "policies" {
  value = module.policies
}
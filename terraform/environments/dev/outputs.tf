output "resource_group_name" {
  description = "Resource group name."
  value       = module.rg.name
}

output "dev_identity_client_id" {
  description = "Client ID of DEV managed identity"
  value       = module.dev_identity.client_id
}

output "dev_identity_principal_id" {
  description = "Principal ID of DEV managed identity"
  value       = module.dev_identity.principal_id
}
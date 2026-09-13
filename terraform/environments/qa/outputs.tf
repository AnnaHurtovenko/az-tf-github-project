output "resource_group_name" {
  description = "Resource group name."
  value       = module.rg.name
}

output "qa_identity_client_id" {
  description = "Client ID of QA managed identity"
  value       = module.qa_identity.client_id
}

output "qa_identity_principal_id" {
  description = "Principal ID of QA managed identity"
  value       = module.qa_identity.principal_id
}

output "key_vault_id" {
  description = "QA Key Vault resource ID, also used as the scope for RBAC assignments."
  value       = module.key_vault.id
}

output "key_vault_name" {
  description = "QA Key Vault name."
  value       = module.key_vault.name
}

output "key_vault_uri" {
  description = "QA Key Vault endpoint URI."
  value       = module.key_vault.vault_uri
}

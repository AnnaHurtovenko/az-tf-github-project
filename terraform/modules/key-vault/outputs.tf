output "id" {
  description = "Key Vault resource ID, also used as the scope for RBAC assignments."
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Key Vault name."
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "Key Vault endpoint URI."
  value       = azurerm_key_vault.this.vault_uri
}



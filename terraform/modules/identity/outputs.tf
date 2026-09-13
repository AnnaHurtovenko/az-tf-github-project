output "id" {
  description = "ID of the user-assigned managed identity."
  value       = azurerm_user_assigned_identity.shared.id
}

output "name" {
  description = "Name of the user-assigned managed identity."
  value       = azurerm_user_assigned_identity.shared.name
}

output "principal_id" {
  description = "Principal ID of the user-assigned managed identity."
  value       = azurerm_user_assigned_identity.shared.principal_id
}

output "client_id" {
  description = "Client ID of the user-assigned managed identity."
  value       = azurerm_user_assigned_identity.shared.client_id
}

output "tenant_id" {
  description = "Tenant ID of the user-assigned managed identity."
  value       = azurerm_user_assigned_identity.shared.tenant_id
}
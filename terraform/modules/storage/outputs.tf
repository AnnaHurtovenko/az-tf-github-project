output "id" {
  description = "The ID of the Storage Account."
  value       = azurerm_storage_account.main.id
}

output "name" {
  description = "The name of the Storage Account."
  value       = azurerm_storage_account.main.name
}

output "primary_location" {
  description = "The primary location of the Storage Account."
  value       = azurerm_storage_account.main.primary_location
}

output "primary_blob_endpoint" {
  description = "The endpoint URL for blob storage in the primary location."
  value       = azurerm_storage_account.main.primary_blob_endpoint
}

output "primary_blob_host" {
  description = "The hostname with port if applicable for blob storage in the primary location."
  value       = azurerm_storage_account.main.primary_blob_host
}

output "primary_connection_string" {
  description = "The connection string associated with the primary location."
  value       = azurerm_storage_account.main.primary_connection_string
  sensitive   = true
}

output "primary_access_key" {
  description = "The primary access key for the Storage Account."
  value       = azurerm_storage_account.main.primary_access_key
  sensitive   = true
}

output "secondary_access_key" {
  description = "The secondary access key for the Storage Account."
  value       = azurerm_storage_account.main.secondary_access_key
  sensitive   = true
}

output "container_names" {
  description = "List of created container names."
  value       = [for container in azurerm_storage_container.containers : container.name]
}

output "resource_group_name" {
  description = "The resource group name of the Storage Account."
  value       = var.resource_group_name
}

output "storage_account_location" {
  description = "The location of the Storage Account."
  value       = var.storage_account_location
}

output "storage_account_id" {
  description = "The ID of the Storage Account (alias for id)."
  value       = azurerm_storage_account.main.id
}


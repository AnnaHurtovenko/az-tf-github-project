variable "resource_group_name" {
  description = "Name of the resource group to create."
  type        = string
}

variable "resource_group_location" {
  description = "Azure region for the resource group."
  type        = string
}

variable "tags" {
  description = "Tags for the resource group."
  type        = map(string)
  default     = {}
}

variable "qa_identity_name" {
  description = "Name of the managed identity created in the QA resource group."
  type        = string
}

variable "identity_location" {
  description = "Azure region for the user-assigned managed identity."
  type        = string
}

variable "bootstrap_storage_account_name" {
  description = "Existing Terraform state storage account created by bootstrap."
  type        = string
}

variable "bootstrap_resource_group_name" {
  description = "Resource group containing the bootstrap storage account."
  type        = string
}

variable "key_vault_name" {
  description = "Globally unique name of the QA Key Vault."
  type        = string
}

variable "key_vault_rbac_enabled" {
  description = "Enable RBAC authorization for the Key Vault."
  type        = bool
  default     = true
}

variable "key_vault_sku_name" {
  description = "SKU name of the Key Vault."
  type        = string
}

variable "key_vault_soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault resources."
  type        = number
}

variable "key_vault_purge_protection_enabled" {
  description = "Enable purge protection for the Key Vault."
  type        = bool
}

variable "key_vault_public_network_access_enabled" {
  description = "Enable public network access to the Key Vault."
  type        = bool
}


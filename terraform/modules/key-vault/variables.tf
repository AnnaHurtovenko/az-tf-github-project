variable "name" {
  description = "Name of the Azure Key Vault."
  type        = string
}

variable "location" {
  description = "Azure region for the Key Vault."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the Key Vault will be created."
  type        = string
}

variable "tenant_id" {
  description = "Azure tenant ID."
  type        = string
}

variable "sku_name" {
  description = "SKU name of the Key Vault."
  type        = string
}

variable "rbac_authorization_enabled" {
  description = "Enable Azure RBAC authorization for Key Vault."
  type        = bool
}

variable "soft_delete_retention_days" {
  description = "Number of days to retain deleted Key Vault resources."
  type        = number
}

variable "purge_protection_enabled" {
  description = "Enable purge protection."
  type        = bool
}

variable "public_network_access_enabled" {
  description = "Enable public network access to Key Vault."
  type        = bool
}

variable "tags" {
  description = "Tags assigned to the Key Vault."
  type        = map(string)
  default     = {}
}
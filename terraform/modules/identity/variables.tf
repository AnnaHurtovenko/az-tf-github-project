variable "identity_name" {
  description = "Name of the user-assigned managed identity."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the managed identity is created."
  type        = string
}

variable "location" {
  description = "Azure region where the managed identity is created."
  type        = string
}

variable "tags" {
  description = "Tags to assign to the managed identity."
  type        = map(string)
  default     = {}
}

variable "grant_contributor" {
  description = "Whether to grant the Contributor role."
  type        = bool
  default     = false
}

variable "contributor_scope" {
  description = "Azure resource ID used as the scope for the Contributor role."
  type        = string
  default     = null
}

variable "grant_storage_blob_data_contributor" {
  description = "Whether to grant Storage Blob Data Contributor."
  type        = bool
  default     = false
}

variable "storage_account_id" {
  description = "Storage Account resource ID used as the scope for Storage Blob Data Contributor."
  type        = string
  default     = null
}

variable "grant_storage_reader" {
  type    = bool
  default = false
}
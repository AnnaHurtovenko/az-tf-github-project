variable "resource_group_location" {
  description = "Azure region for bootstrap resource group"
  type        = string
}

variable "storage_account_location" {
  description = "Azure region for Terraform state storage account"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group for Terraform bootstrap resources"
  type        = string
}

variable "storage_account_name" {
  description = "Storage account used for Terraform remote state"
  type        = string
}

variable "containers" {
  description = "Private containers for Terraform state."
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Common tags for bootstrap resources."
  type        = map(string)
  default     = {}
}



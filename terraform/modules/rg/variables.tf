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

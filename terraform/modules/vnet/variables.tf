variable "vnet_name" {
  description = "Name of the virtual network."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group where the virtual network will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the virtual network."
  type        = string
}

variable "address_space" {
  description = "Address space of the virtual network."
  type        = list(string)
}

variable "subnets" {
  description = "Map of subnets to create in the virtual network."

  type = map(object({
    address_prefixes = list(string)
  }))
}

variable "tags" {
  description = "Tags to assign to network resources."
  type        = map(string)
  default     = {}
}
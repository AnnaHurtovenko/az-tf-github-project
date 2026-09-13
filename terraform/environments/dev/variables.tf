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

variable "dev_identity_name" {
  description = "Name of the managed identity created in the DEV resource group."
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

variable "identity_location" {
  description = "Azure region for user-assigned managed identities"
  type        = string
}

variable "aks_api_server_authorized_ip_ranges" {
  description = "Public IPv4 CIDRs authorized to access the AKS API server. Use /32 for one admin IP."
  type        = list(string)

  validation {
    condition     = length(var.aks_api_server_authorized_ip_ranges) > 0 && alltrue([for cidr in var.aks_api_server_authorized_ip_ranges : can(cidrnetmask(cidr)) && cidr != "0.0.0.0/0"])
    error_message = "Provide at least one public IPv4 CIDR, such as your admin IP with /32; unrestricted access is not allowed in DEV."
  }
}
variable "storage_account_name" {
  description = "Globally unique DEV storage account name."
  type        = string
}

variable "storage_account_location" {
  description = "Region of the DEV storage account."
  type        = string
}

variable "containers" {
  description = "Private containers in DEV storage."
  type        = list(string)
  default     = []
}

variable "vnet_name" {
  description = "DEV virtual network name."
  type        = string
}

variable "vnet_address_space" {
  description = "Virtual network CIDR ranges."
  type        = list(string)
}

variable "subnets" {
  description = "Subnets keyed by name."
  type        = map(object({ address_prefixes = list(string) }))
}

variable "aks_subnet_name" {
  description = "Key of the AKS subnet in subnets."
  type        = string
}


variable "aks_cluster_name" {
  description = "AKS cluster name."
  type        = string
}

variable "aks_dns_prefix" {
  description = "AKS DNS prefix."
  type        = string
}

variable "aks_kubernetes_version" {
  description = "AKS version; null selects the Azure default for the region."
  type        = string
  default     = null
}

variable "aks_node_pool_name" {
  description = "System node pool name."
  type        = string
}

variable "aks_node_vm_size" {
  description = "Supported system node pool VM size."
  type        = string
}

variable "aks_node_count" {
  description = "Node count when autoscaling is disabled."
  type        = number
}

variable "aks_auto_scaling_enabled" {
  description = "Enable node autoscaling."
  type        = bool
}

variable "aks_min_count" {
  description = "Autoscaler minimum node count."
  type        = number
}

variable "aks_max_count" {
  description = "Autoscaler maximum node count."
  type        = number
}

variable "aks_identity_type" {
  description = "DEV uses the existing dev_identity with Contributor on the DEV resource group."
  type        = string
  validation {
    condition     = var.aks_identity_type == "UserAssigned"
    error_message = "DEV requires UserAssigned to use dev_identity."
  }
}

variable "aks_network_plugin" {
  description = "AKS network plugin."
  type        = string
}

variable "aks_network_plugin_mode" {
  description = "AKS network plugin mode."
  type        = string
}

variable "aks_service_cidr" {
  description = "Kubernetes service CIDR, separate from VNet and pods."
  type        = string
}

variable "aks_dns_service_ip" {
  description = "DNS IP within the service CIDR."
  type        = string
}

variable "aks_pod_cidr" {
  description = "Overlay pod CIDR, separate from VNet and services."
  type        = string
}

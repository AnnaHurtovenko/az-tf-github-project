variable "cluster_name" {
  description = "Name of the AKS cluster."
  type        = string
}

variable "location" {
  description = "Azure region for the AKS cluster."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group where the AKS cluster will be created."
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster."
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version for the AKS cluster."
  type        = string
  default     = null
}

variable "subnet_id" {
  description = "Subnet ID for the AKS default node pool."
  type        = string
}

variable "node_pool_name" {
  description = "Name of the default node pool."
  type        = string
}

variable "node_vm_size" {
  description = "VM size for the default node pool."
  type        = string
}

variable "node_count" {
  description = "Number of nodes when autoscaling is disabled."
  type        = number
}

variable "auto_scaling_enabled" {
  description = "Whether cluster autoscaling is enabled."
  type        = bool
}

variable "min_count" {
  description = "Minimum number of nodes when autoscaling is enabled."
  type        = number
}

variable "max_count" {
  description = "Maximum number of nodes when autoscaling is enabled."
  type        = number
}

variable "identity_type" {
  description = "Type of managed identity used by AKS."
  type        = string

  validation {
    condition = contains([
      "SystemAssigned",
      "UserAssigned"
    ], var.identity_type)

    error_message = "identity_type must be SystemAssigned or UserAssigned."
  }
}

variable "identity_ids" {
  description = "List of User Assigned Managed Identity IDs."
  type        = list(string)
  default     = []
}

variable "network_plugin" {
  description = "Network plugin used by AKS."
  type        = string
}

variable "network_plugin_mode" {
  description = "Network plugin mode used by AKS."
  type        = string
  default     = null
}

variable "service_cidr" {
  description = "CIDR used for Kubernetes services."
  type        = string
}

variable "dns_service_ip" {
  description = "IP address used by Kubernetes DNS."
  type        = string
}

variable "tags" {
  description = "Tags assigned to AKS resources."
  type        = map(string)
  default     = {}
}

variable "api_server_authorized_ip_ranges" {
  description = "CIDR ranges authorized to access the AKS API server."
  type        = list(string)
}
variable "pod_cidr" {
  description = "Pod CIDR for overlay or kubenet; must not overlap VNet or service ranges."
  type        = string
  default     = null
}

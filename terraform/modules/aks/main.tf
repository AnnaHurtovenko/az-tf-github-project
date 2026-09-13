resource "azurerm_kubernetes_cluster" "main" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  kubernetes_version  = var.kubernetes_version

  api_server_access_profile {
    authorized_ip_ranges = var.api_server_authorized_ip_ranges
  }
  default_node_pool {
    name           = var.node_pool_name
    vm_size        = var.node_vm_size
    vnet_subnet_id = var.subnet_id
    node_count     = var.auto_scaling_enabled ? null : var.node_count

    auto_scaling_enabled = var.auto_scaling_enabled
    min_count            = var.auto_scaling_enabled ? var.min_count : null
    max_count            = var.auto_scaling_enabled ? var.max_count : null
  }

  identity {
    type         = var.identity_type
    identity_ids = var.identity_type == "UserAssigned" ? var.identity_ids : null
  }

  network_profile {
    network_plugin      = var.network_plugin
    network_plugin_mode = var.network_plugin_mode
    service_cidr        = var.service_cidr
    dns_service_ip      = var.dns_service_ip
    pod_cidr            = var.pod_cidr
  }

  tags = var.tags
}
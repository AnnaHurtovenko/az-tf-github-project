module "rg" {
  source = "../../modules/rg"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  tags                    = var.tags
}

module "dev_identity" {
  source = "../../modules/identity"

  identity_name       = var.dev_identity_name
  resource_group_name = module.rg.name
  location            = var.identity_location

  grant_contributor = true
  contributor_scope = module.rg.id

  grant_storage_blob_data_contributor = true
  storage_account_id                  = data.azurerm_storage_account.bootstrap.id
  tags                                = merge(var.tags, { environment = "dev" })
}

data "azurerm_storage_account" "bootstrap" {
  name                = var.bootstrap_storage_account_name
  resource_group_name = var.bootstrap_resource_group_name
}


module "storage" {
  source = "../../modules/storage"

  storage_account_name     = var.storage_account_name
  resource_group_name      = module.rg.name
  storage_account_location = var.storage_account_location
  containers               = var.containers
  tags                     = var.tags
}

module "network" {
  source = "../../modules/vnet"

  vnet_name           = var.vnet_name
  resource_group_name = module.rg.name
  location            = module.rg.location
  address_space       = var.vnet_address_space
  subnets             = var.subnets

  tags = var.tags
}


module "aks" {
  depends_on = [module.dev_identity]

  source = "../../modules/aks"

  cluster_name                    = var.aks_cluster_name
  location                        = module.rg.location
  resource_group_name             = module.rg.name
  dns_prefix                      = var.aks_dns_prefix
  kubernetes_version              = var.aks_kubernetes_version
  api_server_authorized_ip_ranges = var.aks_api_server_authorized_ip_ranges
  subnet_id                       = module.network.subnet_ids[var.aks_subnet_name]

  node_pool_name       = var.aks_node_pool_name
  node_vm_size         = var.aks_node_vm_size
  node_count           = var.aks_node_count
  auto_scaling_enabled = var.aks_auto_scaling_enabled
  min_count            = var.aks_min_count
  max_count            = var.aks_max_count

  identity_type       = var.aks_identity_type
  identity_ids        = [module.dev_identity.id]
  network_plugin      = var.aks_network_plugin
  network_plugin_mode = var.aks_network_plugin_mode
  service_cidr        = var.aks_service_cidr
  dns_service_ip      = var.aks_dns_service_ip
  pod_cidr            = var.aks_pod_cidr

  tags = var.tags
}
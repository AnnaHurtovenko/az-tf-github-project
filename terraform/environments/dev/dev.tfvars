#resource group
resource_group_name     = "dev-rg"
resource_group_location = "westeurope"

tags = {
  environment = "dev"
  project     = "az-tf-github-project"
  managed_by  = "terraform"
}

#storage
storage_account_location = "northeurope"
storage_account_name     = "devstorageaz06"

#identity
dev_identity_name              = "dev-mi"
identity_location              = "northeurope"
bootstrap_storage_account_name = "bootstrapstate"
bootstrap_resource_group_name  = "bootstrap-rg"

#vnet
vnet_name          = "dev-vnet"
vnet_address_space = ["10.10.0.0/16"]
subnets = {
  aks-subnet = {
    address_prefixes = ["10.10.1.0/24"]
  }

  infra-subnet = {
    address_prefixes = ["10.10.2.0/24"]
  }
}


#aks
aks_cluster_name       = "dev-aks"
aks_dns_prefix         = "dev-aks"
aks_kubernetes_version = null
workload_location      = "northeurope"

aks_node_pool_name = "system"
aks_node_vm_size   = "Standard_EC2as_v5"
aks_node_count     = 1

aks_auto_scaling_enabled = false
aks_min_count            = 1
aks_max_count            = 2
aks_identity_type        = "UserAssigned"

aks_network_plugin                  = "azure"
aks_network_plugin_mode             = "overlay"
aks_service_cidr                    = "10.20.0.0/16"
aks_dns_service_ip                  = "10.20.0.10"
containers                          = []
aks_subnet_name                     = "aks-subnet"
aks_pod_cidr                        = "10.244.0.0/16"
aks_api_server_authorized_ip_ranges = ["176.104.184.121/32"]

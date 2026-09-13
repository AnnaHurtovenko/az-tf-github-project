#resource group
resource_group_name                    = "qa-rg"
resource_group_location                = "westeurope"

tags = {
  environment = "qa"
  project     = "az-tf-github-project"
  managed_by  = "terraform"
}

#identity
qa_identity_name                        = "qa-mi"
identity_location                       = "northeurope"
bootstrap_storage_account_name          = "bootstrapstate"
bootstrap_resource_group_name           = "bootstrap-rg"

#key-vault 
key_vault_name                          = "qa-kv"
key_vault_sku_name                      = "standard"
key_vault_rbac_enabled                  = true
key_vault_soft_delete_retention_days    = 7
key_vault_purge_protection_enabled      = false
key_vault_public_network_access_enabled = true

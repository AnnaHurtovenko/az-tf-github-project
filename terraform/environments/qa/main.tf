module "rg" {
  source = "../../modules/rg"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  tags                    = var.tags
}


module "qa_identity" {
  source = "../../modules/identity"

  identity_name       = var.qa_identity_name
  resource_group_name = module.rg.name
  location            = var.identity_location
  grant_contributor   = true
  contributor_scope   = module.rg.id

  grant_storage_blob_data_contributor = true
  grant_storage_reader                = true
  storage_account_id                  = data.azurerm_storage_account.bootstrap.id
  tags                                = merge(var.tags, { environment = "qa" })
}

data "azurerm_storage_account" "bootstrap" {
  name                = var.bootstrap_storage_account_name
  resource_group_name = var.bootstrap_resource_group_name
}

data "azurerm_client_config" "current" {}

module "key_vault" {
  source = "../../modules/key-vault"

  name                = var.key_vault_name
  resource_group_name = module.rg.name
  location            = module.rg.location
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name                      = var.key_vault_sku_name
  rbac_authorization_enabled    = var.key_vault_rbac_enabled
  soft_delete_retention_days    = var.key_vault_soft_delete_retention_days
  purge_protection_enabled      = var.key_vault_purge_protection_enabled
  public_network_access_enabled = var.key_vault_public_network_access_enabled

  tags = merge(var.tags, { environment = "qa" })
}

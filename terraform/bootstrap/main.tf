module "rg" {
  source = "../modules/rg"

  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
  tags                    = var.tags
}

module "storage" {
  source = "../modules/storage"

  storage_account_name     = var.storage_account_name
  resource_group_name      = module.rg.name
  storage_account_location = var.storage_account_location
  containers               = var.containers
  tags                     = var.tags
}

moved {
  from = azurerm_resource_group.bootstrap
  to   = module.rg.azurerm_resource_group.main
}

moved {
  from = azurerm_storage_account.tfstate
  to   = module.storage.azurerm_storage_account.main
}




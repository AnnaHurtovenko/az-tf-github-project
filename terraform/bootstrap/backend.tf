terraform {
  backend "azurerm" {
    resource_group_name  = "bootstrap-rg"
    storage_account_name = "bootstrapstate"
    container_name       = "tfstate"
    key                  = "bootstrap.tfstate"
  }
}
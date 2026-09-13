terraform {
  backend "azurerm" {
    resource_group_name  = "bootstrap-rg"
    storage_account_name = "bootstrapstate"
    container_name       = "tfstate"
    key                  = "dev.tfstate"

    use_oidc             = true
    use_azuread_auth     = true
  }
}
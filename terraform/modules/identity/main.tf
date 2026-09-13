resource "azurerm_user_assigned_identity" "shared" {
  name                = var.identity_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Contributor
resource "azurerm_role_assignment" "resource_group_contributor" {
  count = var.grant_contributor ? 1 : 0

  scope                = var.contributor_scope
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.shared.principal_id
}


# Storage Blob Data Contributor
resource "azurerm_role_assignment" "storage_blob_data_contributor" {
  count = var.grant_storage_blob_data_contributor ? 1 : 0

  scope                = var.storage_account_id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.shared.principal_id
}

resource "azurerm_role_assignment" "storage_reader" {
  count = var.grant_storage_reader ? 1 : 0

  scope                = var.storage_account_id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.shared.principal_id
}
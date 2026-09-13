output "bootstrap_resource_group_id" {
  description = "Bootstrap resource group ID"
  value       = module.rg.id
}

output "storage_account_id" {
  description = "Terraform state storage account ID"
  value       = module.storage.id
}




output "vnet_id" {
  description = "ID of the virtual network."
  value       = azurerm_virtual_network.main.id
}

output "vnet_name" {
  description = "Name of the virtual network."
  value       = azurerm_virtual_network.main.name
}

output "subnet_ids" {
  description = "Map of subnet names to subnet IDs."

  value = {
    for name, subnet in azurerm_subnet.main :
    name => subnet.id
  }
}

output "subnet_names" {
  description = "Map of subnet keys to subnet names."

  value = {
    for name, subnet in azurerm_subnet.main :
    name => subnet.name
  }
}
output "id" {
  description = "AKS cluster ID."
  value       = azurerm_kubernetes_cluster.main.id
}

output "name" {
  description = "AKS cluster name."
  value       = azurerm_kubernetes_cluster.main.name
}

output "kubelet_identity_object_id" {
  description = "Object ID of the AKS kubelet identity."
  value       = azurerm_kubernetes_cluster.main.kubelet_identity[0].object_id
}

output "node_resource_group" {
  description = "Resource group automatically created for AKS nodes."
  value       = azurerm_kubernetes_cluster.main.node_resource_group
}
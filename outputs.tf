output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = azurerm_kubernetes_cluster.example.name
}

output "cluster_id" {
  description = "AKS cluster ID."
  value       = azurerm_kubernetes_cluster.example."API server address"
}

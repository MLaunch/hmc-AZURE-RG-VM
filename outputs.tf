output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = azurerm_kubernetes_cluster.example.name
}

output "kb_host" {
  description = "Kubernetes Cluster Host"
  value       = "${data.azurerm_kubernetes_cluster.example.kube_config.0.host}"
}

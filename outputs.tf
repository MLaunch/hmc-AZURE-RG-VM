output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = azurerm_kubernetes_cluster.example.name
}

output "kb_host" {
  description = "Kubernetes Cluster Host"
  value       = "${data.azurerm_kubernetes_cluster.example.kube_config.0.host}"
}

output "client_certificate" {
  description = "Kubernetes Cluster Host"
  value       = "{base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.client_certificate)}"
}

output "client_key" {
  description = "Kubernetes Cluster Host"
  value       = "${base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.client_key)}"
}

output "cluster_ca_certificate" {
  description = "Kubernetes Cluster Host"
  value       = "${base64decode(data.azurerm_kubernetes_cluster.example.kube_config.0.cluster_ca_certificate)}"
}

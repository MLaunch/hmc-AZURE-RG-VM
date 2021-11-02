
provider "helm" {
  kubernetes {
    host                   = azurerm_kubernetes_cluster.example.cluster.endpoint
    cluster_ca_certificate = base64decode(azurerm_kubernetes_cluster.example.cluster.certificate_authority.0.data)
    exec {
      api_version = "client.authentication.k8s.io/v1alpha1"
      args        = ["aks", "get-token", "--cluster-name", azurerm_kubernetes_cluster.example.cluster.name]
      command     = "aws"
    }
  }
}

resource "helm_release" "kubewatch" {
  name       = "kubewatch"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "kubewatch"

  values = [
    file("${path.module}/kubewatch-values.yaml")
  ]

  set_sensitive {
    name  = "slack.token"
    value = var.slack_app_token
  }
}

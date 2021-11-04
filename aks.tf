resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  location            = var.region
  resource_group_name = azurerm_resource_group.myterraformgroup.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    team = var.team
    project = var.project
  }
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}

output "aks_endpoint" {
  value = azurerm_kubernetes_cluster.example."API server address"

  sensitive = true
}

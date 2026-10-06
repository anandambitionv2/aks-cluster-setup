data "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-argocd-cluster-central"
  resource_group_name = "aks-rg"
}
provider "helm" {
  kubernetes =  {
    host                   = data.azurerm_kubernetes_cluster.aks.kube_config[0].host
    cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.aks.kube_config[0].cluster_ca_certificate)

    # This replaces the local file structure completely
    exec = {
      api_version = "client.authentication.k8s.io/v1"
      command     = "kubelogin"
      
      # Instructs kubelogin to run in non-interactive Service Principal mode
      args = [
        "get-token",
        "--server-id",
        "be88c650-c841-4259-a3d5-862fe02b71a7", # Default AAD client ID for all managed AKS clusters
        "--login",
        "azurecli"
      ]

      # Expose your CI/CD runner secrets as environment variables to the execution process
      
    }
  }
}
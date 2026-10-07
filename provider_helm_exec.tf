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
        "6dae42f8-4368-4678-94ff-3960e28e3630", # Default AAD client ID for all managed AKS clusters
        "--login",
        "azurecli"
      ]

      # Expose your CI/CD runner secrets as environment variables to the execution process
      
    }
  }
}
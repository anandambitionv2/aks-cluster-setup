aks_clusters = {
  "aks_cluster_1" = {
    name                = "aks-argocd-cluster-central"
    location            = "centralindia"
    resource_group_name = "aks-rg"
    dns_prefix          = "aks-argocd-cluster-central"
    identity_type       = "SystemAssigned"
    node_provisioning_profile = {
      mode = "Manual"
    }
    azure_active_directory_role_based_access_control = {

      azure_rbac_enabled = true
    }
    default_node_pool = {
      name            = "default"
      node_count      = 1
      vm_size         = "Standard_D2pls_v6"
      os_disk_size_gb = 30
      os_sku          = "Ubuntu"
      vnet_subnet_id  = "/subscriptions/228a46db-66c5-4a23-9ed7-677a552990bc/resourceGroups/test/providers/Microsoft.Network/virtualNetworks/aks-vnet-argo/subnets/default"
      node_network_profile = {
        network_plugin      = "azure"
        network_policy      = "calico"
        network_plugin_mode = "overlay"
        pod_cidr            = "10.244.0.0/16"
      }
    }
  }
}

releases = {

   "sample" = {
     name             = "podinfo-test-release"
    repository       = "oci://ghcr.io/stefanprodan/charts" # Points directly to GHCR OCI root
    chart            = "podinfo"                           # Maps cleanly to the image name
    version          = "6.6.2"
    namespace        = "sample"
    create_namespace = true
  }
  # "r1" = {
  #   name             = "argo-server-release"
  #   repository       = "https://argoproj.github.io/argo-helm"
  #   chart            = "argo-cd"
  #   version          = "10.9.6"
  #   namespace        = "argocd"
  #   create_namespace = true
  # }
}
# 

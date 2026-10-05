module "aks_clusters" {
  source = "./modules/aks"
aks_clusters = var.aks_clusters
}

module "helm" {
    source = "./modules/helm-release"
    releases = var.releases
  
}


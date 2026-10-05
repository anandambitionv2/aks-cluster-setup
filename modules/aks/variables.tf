variable "aks_clusters" {
  description = "A map of AKS cluster configurations"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    dns_prefix          = string
    node_provisioning_profile = object({
      mode = string
    })
    default_node_pool   = object({
      name       = string
      node_count = number
      vm_size    = string
      os_disk_size_gb = number
      os_sku     = string
      vnet_subnet_id = string
      node_network_profile = object({
        network_plugin       = string
        network_policy       = string
        network_plugin_mode  = string
        pod_cidr             = string
      })
    })
  identity_type       = optional(string)
    tags                = optional(map(string))
  }))   
  
}
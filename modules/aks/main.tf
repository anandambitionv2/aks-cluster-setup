resource "azurerm_resource_group" "aks-rg" {
  name     = "aks-rg"
  location = "centralindia"
}

resource "azurerm_kubernetes_cluster" "aks" {
    for_each = var.aks_clusters
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  dns_prefix          = each.value.dns_prefix
   network_profile {
     
        network_plugin = each.value.default_node_pool.node_network_profile.network_plugin   
      network_policy = each.value.default_node_pool.node_network_profile.network_policy
    network_plugin_mode = each.value.default_node_pool.node_network_profile.network_plugin_mode
    pod_cidr = each.value.default_node_pool.node_network_profile.pod_cidr   
    }
    node_provisioning_profile {
      mode = each.value.node_provisioning_profile.mode
    }

  default_node_pool {
    name       = each.value.default_node_pool.name
    node_count = each.value.default_node_pool.node_count
    vm_size    = each.value.default_node_pool.vm_size
    os_disk_size_gb = each.value.default_node_pool.os_disk_size_gb
    os_sku = each.value.default_node_pool.os_sku
    vnet_subnet_id = each.value.default_node_pool.vnet_subnet_id
   
    
  }

  identity {
    type = each.value.identity_type
  }

  tags = each.value.tags
  depends_on = [ azurerm_resource_group.aks-rg ]
  
}



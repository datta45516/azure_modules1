terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.2"
}

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  kubernetes_version = var.kubernetes_version

  default_node_pool {
    name                = var.default_node_pool.name
    vm_size             = var.default_node_pool.vm_size
    node_count          = var.default_node_pool.node_count
    os_disk_size_gb     = var.default_node_pool.os_disk_size_gb
    max_pods            = var.default_node_pool.max_pods
    vnet_subnet_id      = var.default_node_pool.vnet_subnet_id
    enable_auto_scaling = var.default_node_pool.enable_auto_scaling
    min_count           = var.default_node_pool.min_count
    max_count           = var.default_node_pool.max_count
    type                = var.default_node_pool.type
    mode                = var.default_node_pool.mode
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = var.network_plugin
    network_policy    = var.network_policy
    load_balancer_sku = var.load_balancer_sku
    outbound_type     = var.outbound_type
  }

  role_based_access_control {
    enabled = true
  }

  tags = var.tags
}

# Optional additional node pools (map of objects)
locals {
  extra_node_pools = var.extra_node_pools
}

resource "azurerm_kubernetes_cluster_node_pool" "extra" {
  for_each            = local.extra_node_pools
  name                = each.key
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size             = each.value.vm_size
  node_count          = each.value.node_count
  os_disk_size_gb     = try(each.value.os_disk_size_gb, 0)
  vnet_subnet_id      = try(each.value.vnet_subnet_id, null)
  enable_auto_scaling = try(each.value.enable_auto_scaling, false)
  min_count           = try(each.value.min_count, null)
  max_count           = try(each.value.max_count, null)
  mode                = try(each.value.mode, "User")
  type                = try(each.value.type, "VirtualMachineScaleSets")
}

# Optional: add monitoring addon if workspace provided
resource "azurerm_kubernetes_cluster" "monitoring_patch" {
  # This resource reference is used only to attach monitoring via addon_profile when workspace id provided.
  count               = var.log_analytics_workspace_id == "" ? 0 : 1
  name                = azurerm_kubernetes_cluster.this[count.index].name
  location            = azurerm_kubernetes_cluster.this[count.index].location
  resource_group_name = azurerm_kubernetes_cluster.this[count.index].resource_group_name

  addon_profile {
    oms_agent {
      enabled                    = true
      log_analytics_workspace_id = var.log_analytics_workspace_id
    }
  }

  lifecycle {
    ignore_changes = [default_node_pool] # don't overwrite node pools via this patch resource
  }
}

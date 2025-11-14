variable "cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "resource_group_name" {
  description = "Existing resource group for AKS"
  type        = string
}

variable "location" {
  description = "Azure region, e.g. eastus"
  type        = string
}

variable "dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version (optional). Leave empty for latest supported by provider."
  type        = string
  default     = ""
}

variable "network_plugin" {
  description = "Network plugin. Example: azure or kubenet"
  type        = string
  default     = "azure"
}

variable "network_policy" {
  description = "Network policy: calico or azure"
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "Load balancer SKU: Basic or Standard"
  type        = string
  default     = "Standard"
}

variable "outbound_type" {
  description = "Outbound type: loadBalancer (default) or userDefinedRouting or managedNATGateway"
  type        = string
  default     = "loadBalancer"
}

variable "tags" {
  description = "Map of tags to apply"
  type        = map(string)
  default     = {}
}

# Default node pool object
variable "default_node_pool" {
  description = "Object describing the default node pool"
  type = object({
    name                = string
    vm_size             = string
    node_count          = number
    os_disk_size_gb     = number
    max_pods            = number
    vnet_subnet_id      = string
    enable_auto_scaling = bool
    min_count           = number
    max_count           = number
    type                = string
    mode                = string
  })
  default = {
    name                = "agentpool"
    vm_size             = "Standard_DS2_v2"
    node_count          = 3
    os_disk_size_gb     = 30
    max_pods            = 110
    vnet_subnet_id      = ""
    enable_auto_scaling = false
    min_count           = 1
    max_count           = 3
    type                = "VirtualMachineScaleSets"
    mode                = "System"
  }
}

variable "extra_node_pools" {
  description = "Map of extra node pools. Key is pool name. See example in module README."
  type = map(object({
    vm_size             = string
    node_count          = number
    os_disk_size_gb     = optional(number)
    vnet_subnet_id      = optional(string)
    enable_auto_scaling = optional(bool)
    min_count           = optional(number)
    max_count           = optional(number)
    mode                = optional(string)
    type                = optional(string)
  }))
  default = {}
}

variable "log_analytics_workspace_id" {
  description = "Optional: Log Analytics workspace resource id to enable monitoring. Leave empty to disable."
  type        = string
  default     = ""
}

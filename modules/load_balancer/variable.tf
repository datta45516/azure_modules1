variable "name" {
  description = "Base name for resources"
  type        = string
}

variable "location" {
  description = "Azure location/region"
  type        = string
}

variable "resource_group_name" {
  description = "Target resource group name"
  type        = string
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

variable "public_ip_allocation" {
  description = "Public IP allocation method (Static or Dynamic)"
  type        = string
  default     = "Static"
}

variable "public_ip_sku" {
  description = "Public IP SKU (Standard or Basic)"
  type        = string
  default     = "Standard"
}

variable "lb_sku" {
  description = "Load Balancer SKU (Standard or Basic)"
  type        = string
  default     = "Standard"
}

variable "frontend_ip_name" {
  description = "Frontend IP configuration name"
  type        = string
  default     = "PublicIPAddress"
}

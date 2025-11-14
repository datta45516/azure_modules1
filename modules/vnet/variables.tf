variable "vnet_name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region/ location"
  type        = string
}

variable "address_space" {
  description = "List of address spaces for the VNet (e.g. [\"10.0.0.0/16\"])"
  type        = list(string)
}

variable "dns_servers" {
  description = "Optional list of DNS servers"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Tags to apply to the VNet"
  type        = map(string)
  default     = {}
}

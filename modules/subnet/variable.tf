variable "subnet_name" {
  description = "Name of the Subnet"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "virtual_network_name" {
  description = "Virtual Network name"
  type        = string
}

variable "address_prefixes" {
  description = "List of address prefixes for the subnet"
  type        = list(string)
}

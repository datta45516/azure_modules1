variable "storage_account_name" {
  description = "Name of the Storage Account"
  type        = string
}

variable "container_name" {
  description = "Name of the Storage Container"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "location" {
  description = "Azure region for the Storage Account"
  type        = string
}

variable "account_tier" {
  description = "Storage Account tier"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type (LRS, GRS, RAGRS, ZRS)"
  type        = string
  default     = "LRS"
}

variable "access_type" {
  description = "Container access level (private, blob, container)"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags to apply to the Storage Account"
  type        = map(string)
  default     = {}
}

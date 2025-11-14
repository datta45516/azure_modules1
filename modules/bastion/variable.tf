variable "bastion_name" {
  description = "Name of the Azure Bastion Host"
  type        = string
  default     = "bastion-host"
}

variable "resource_group_name" {
  description = "Name of the existing resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the Bastion host (e.g. eastus)"
  type        = string
}

variable "subnet_id" {
  description = <<EOF
The resource id of the subnet to attach the Bastion to.
**Important:** this must be the 'AzureBastionSubnet' in the VNet (name exactly AzureBastionSubnet). Example:
/subscriptions/<sub>/resourceGroups/<rg>/providers/Microsoft.Network/virtualNetworks/<vnet>/subnets/AzureBastionSubnet
EOF
  type = string
}

variable "create_public_ip" {
  description = "Whether to create a Public IP for the Bastion. If false, supply public_ip_id."
  type        = bool
  default     = true
}

variable "public_ip_id" {
  description = "Existing Public IP resource id to use when create_public_ip = false."
  type        = string
  default     = ""
}

variable "public_ip_name" {
  description = "Name to use for the created Public IP (only used when create_public_ip = true)."
  type        = string
  default     = "bastion-pip"
}

variable "tags" {
  description = "Tags to apply to created resources"
  type        = map(string)
  default     = {}
}

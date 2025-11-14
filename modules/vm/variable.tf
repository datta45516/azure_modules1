variable "vm_name" {
  description = "Virtual Machine name"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for NIC"
  type        = string
}

variable "vm_size" {
  description = "VM size (e.g., Standard_B1s)"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin username for VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to SSH public key file"
  type        = string
}

variable "enable_public_ip" {
  description = "Create Public IP for VM"
  type        = bool
  default     = true
}

variable "os_disk_type" {
  description = "OS Disk type (Premium_LRS, StandardSSD_LRS, Standard_LRS)"
  type        = string
  default     = "Standard_LRS"
}

# Image
variable "image_publisher" {
  type    = string
  default = "Canonical"
}

variable "image_offer" {
  type    = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "image_sku" {
  type    = string
  default = "22_04-lts-gen2"
}

variable "tags" {
  description = "Tags to apply"
  type        = map(string)
  default     = {}
}

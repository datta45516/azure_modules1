output "bastion_id" {
  description = "Resource ID of the Bastion host"
  value       = azurerm_bastion_host.this.id
}

output "bastion_name" {
  description = "Name of the created Bastion host"
  value       = azurerm_bastion_host.this.name
}

output "public_ip_id" {
  description = "Public IP resource id attached to the Bastion (created or provided)"
  value = var.create_public_ip ? azurerm_public_ip.bastion_pip[0].id : var.public_ip_id
}

output "public_ip_address" {
  description = "Public IP address (if module created the public ip)"
  value       = var.create_public_ip ? azurerm_public_ip.bastion_pip[0].ip_address : ""
  sensitive   = false
}

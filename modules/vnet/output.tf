output "vnet_id" {
  description = "ID of the Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "VNet name"
  value       = azurerm_virtual_network.vnet.name
}

output "address_space" {
  description = "Address space of the VNet"
  value       = azurerm_virtual_network.vnet.address_space
}

output "subnet_ids" {
  description = "Map of created subnet ids (empty if no subnets created)"
  value       = { for k, s in azurerm_subnet.subnets : k => s.id }
}

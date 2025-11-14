terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.0"
    }
  }
  required_version = ">= 1.2"
}

provider "azurerm" {
  features {}
}

# Optional: create a Public IP for Bastion if create_public_ip = true
resource "azurerm_public_ip" "bastion_pip" {
  count               = var.create_public_ip ? 1 : 0
  name                = var.public_ip_name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

resource "azurerm_bastion_host" "this" {
  name                = var.bastion_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  ip_configuration {
    name                 = "ipconfig"
    subnet_id            = var.subnet_id
    public_ip_address_id = var.create_public_ip ? azurerm_public_ip.bastion_pip[0].id : var.public_ip_id
  }

  depends_on = var.create_public_ip ? [azurerm_public_ip.bastion_pip] : []
}

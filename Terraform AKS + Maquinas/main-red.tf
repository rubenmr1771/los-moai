################
## Red - Main ##
################

data "azurerm_resource_group" "rg_FCT_Capgemini_2023_Losmoai" {
  name     = "rg_FCT_Capgemini_2023_Losmoai"
}

resource "azurerm_virtual_network" "network-vnet" {
  name                = "losmoai-${lower(replace(var.app_name," ","-"))}-${var.environment}-vnet"
  address_space       = [var.network-vnet-cidr]
  resource_group_name = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name
  location            = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.location
  tags = {
    application = var.app_name
    environment = var.environment
  }
}

resource "azurerm_subnet" "network-subnet" {
  name                 = "losmoai-${lower(replace(var.app_name," ","-"))}-${var.environment}-subnet"
  address_prefixes     = [var.network-subnet-cidr]
  virtual_network_name = azurerm_virtual_network.network-vnet.name
  resource_group_name  = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name
}

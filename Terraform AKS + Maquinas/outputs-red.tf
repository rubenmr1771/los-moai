###################
## Red - Outputs ##
###################

output "network_resource_group_id" {
  value = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.id
}

output "network_vnet_id" {
  value = azurerm_virtual_network.network-vnet.id
}

output "network_subnet_id" {
  value = azurerm_subnet.network-subnet.id
}

output "nic" {
  value = azurerm_network_interface.maoinic
}

output "storage" {
  value = azurerm_storage_account.moaistorage
}

output "location" {
  value = azurerm_resource_group.moai
}
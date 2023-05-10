<<<<<<< HEAD
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.main.public_ip_address
}

output "admin_password" {
  sensitive = true
  value     = azurerm_windows_virtual_machine.main.admin_password
}
=======
output "globalname" {
  value = azurerm_resource_group.moai.name
}

output "globallocation" {
  value = azurerm_resource_group.moai.location
}

output "name" {
  value = random_pet.randomid
}

output "password" {
  value = random_password.randompass
}
>>>>>>> 1ddca3108e1682e2bcfddd94115d6d628350cbc1

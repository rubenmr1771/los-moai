output "name" {
  value = random_pet.randomid
}

output "password" {
  value = random_password.randompass
}

output "public_ip_address" {
  value = azurerm_windows_virtual_machine.main.public_ip_address
}

output "vm" {
  value = azurerm_windows_virtual_machine.moaivm
}
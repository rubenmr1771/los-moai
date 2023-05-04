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
##################
## VM - Outputs ##
##################

output "linux_vm_name" {
  description = "Virtual Machine name"
  value       = azurerm_linux_virtual_machine.linux-vm
  sensitive   = true
}

output "linux_vm_ip_address" {
  description = "Virtual Machine name IP Address"
  value       = azurerm_public_ip.linux-vm-ip
}

output "linux_vm_admin_username" {
  description = "Username password for the Virtual Machine"
  value       = var.linux_admin_username
}

output "linux_vm_admin_password" {
  description = "Administrator password for the Virtual Machine"
  value       = random_password.linux-vm-password.result
  sensitive   = true
}

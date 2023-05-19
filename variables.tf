variable "rg_location" {
  type        = string
  description = "Localización del grupo de recursos"
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}

variable "main_my_terraform_network_network_name" {}

variable "main_my_terraform_network_network_ip" {}

variable "main_my_terraform_subnet_subnet_name" {}

variable "main_my_terraform_subnet_subnet_prefix" {}

variable "main_my_terraform_public_ip_ip_direction" {}

variable "main_my_terraform_public_ip_method" {}

variable "main_my_terraform_nic_name" {}

variable "main_my_terraform_nic_name_ip_configuration" {}

variable "main_my_terraform_public_ip_method_private_ip_address_allocation" {}

variable "main_my_storage_account_name" {}

variable "main_maquina_virtual_name" {}

variable "main_maquina_virtual_admin_username" {}

variable "main_maquina_virtual_admin_password" {}

variable "main_maquina_virtual_size" {}

variable "main_maquina_virtual_os_disk_name" {}
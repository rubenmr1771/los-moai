
# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

resource azurerm_resource_group "rg" {
    name = "${random_pet.prefix.id}-rg"
    location = var.rg_location
} 


resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}



module "network" {
  source = "./modules/network"
  my_terraform_network_network_name = var.main_my_terraform_network_network_name
  my_terraform_network_network_ip = var.main_my_terraform_network_network_ip
  my_terraform_subnet_subnet_name = var.main_my_terraform_subnet_subnet_name
  my_terraform_subnet_subnet_prefix = var.main_my_terraform_subnet_subnet_prefix
  my_terraform_public_ip_ip_direction = var.main_my_terraform_public_ip_ip_direction
  my_terraform_public_ip_method = var.main_my_terraform_public_ip_method
  my_terraform_nic_name = var.main_my_terraform_nic_name
  my_terraform_nic_name_ip_configuration = var.main_my_terraform_nic_name_ip_configuration
  my_terraform_public_ip_method_private_ip_address_allocation = var.main_my_terraform_public_ip_method_private_ip_address_allocation  
}

module "vm" {
  source = "./modules/vm"
  my_storage_account_name = var.main_my_storage_account_name
  maquina_virtual_name = var.main_maquina_virtual_name
  maquina_virtual_admin_username = var.main_maquina_virtual_admin_username
  maquina_virtual_admin_password = var.main_maquina_virtual_admin_password
  maquina_virtual_size = var.main_maquina_virtual_size
  maquina_virtual_os_disk_name = var.main_maquina_virtual_os_disk_name
}
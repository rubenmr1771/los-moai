
main_my_terraform_network_network_name                   = "my-terraform-network"
main_my_terraform_network_network_ip                     = ["10.0.0.0/16"]
main_my_terraform_subnet_subnet_name                      = "my-terraform-subnet"
main_my_terraform_subnet_subnet_prefix                    = ["10.0.1.0/24"]
main_my_terraform_public_ip_ip_direction                  = "my-terraform-public-ip"
main_my_terraform_public_ip_method                        = "Static"
main_my_terraform_nic_name                                = "my-terraform-nic"
main_my_terraform_nic_name_ip_configuration              = "my-terraform-nic-ip-configuration"
main_my_terraform_public_ip_method_private_ip_address_allocation = "Dynamic"

#Variables definidas para el modulo de VM
main_my_storage_account_name = "cuenta1"
main_maquina_virtual_name   = "maq_linux"
main_maquina_virtual_admin_username = "administrador"
main_maquina_virtual_admin_password = "admin"
main_maquina_virtual_size = "Standard_DS1_v2"
main_maquina_virtual_os_disk_name = "MyOSDisk"


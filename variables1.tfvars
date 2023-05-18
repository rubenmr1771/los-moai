#Variables para el modulo de network
my_terraform_network_network_name                           = "my-terraform-network"
my_terraform_network_network_ip                             = ["10.0.0.0/16"]
my_terraform_subnet_subnet_name                             = "my-terraform-subnet"
my_terraform_subnet_subnet_prefix                           = ["10.0.1.0/24"]
my_terraform_public_ip_ip_direction                         = "my-terraform-public-ip"
my_terraform_public_ip_method                               = "Static"
my_terraform_nic_name                                       = "my-terraform-nic"
my_terraform_nic_name_ip_configuration                      = "my-terraform-nic-ip-configuration"
my_terraform_public_ip_method_private_ip_address_allocation = "Dynamic"

#Variables definidas para el modulo de VM
my_storage_account_name                                     = "cuenta1"
maquina_virtual_name                                        = "maq_linux"
maquina_virtual_admin_username                              = "administrador"
maquina_virtual_admin_password                              = "admin"
maquina_virtual_size                                        = "Standard_DS1_v2"
maquina_virtual_os_disk_name                                = "MyOSDisk"

#Variables para IIS web server para la VM
web_server_install_name                                     = "servidor_web1"

#Variables para el main
rg_location                                                 = "West Europe"
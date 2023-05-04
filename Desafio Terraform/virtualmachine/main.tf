module "providers" {
  source = "../providers"
  providers = {
    azure = azurerm.eu
  }
}
module "imports" {
  source = "../network"
}

resource "azurerm_resource_group" "moai" {
    location = var.region //Conectamos al servidor de azure mediante la variable region especificada en el fichero variables
    name = "Máquina del grupo Los Moai para el desafio Azure"
}

#Crear máquina virtual
resource "azurerm_windows_virtual_machine" "moaivm" {
  name = "${random_pet.randomid}-vm"
  admin_username = var.adminuser
  admin_password = random_password.randompass
  location = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name
  network_interface_ids = module.imports.nic
  size = "Standard_DS1_v2"

os_disk {
  name = "maoiDisk"
  caching = "ReadWrite"
  storage_account_type = "Premium_LRS"
}

source_image_reference {
  publisher = "MicrosoftWindowsServer"
  offer = "WindowsServer"
  sku = "2022-datacenter-azure-edition"
  version = "latest"
    }

boot_diagnostics {
  storage_account_uri = module.imports.storage
    }
}


#Generación de texto y contraseña para los nombres de cuenta
resource "random_pet" "randomid" {
  prefix = var.prefix
  length = 1
}

resource "random_password" "randompass" {
    length = 20
    min_lower = 1
    min_upper = 1
    min_numeric = 3
    min_special = 3
    special = true  
}
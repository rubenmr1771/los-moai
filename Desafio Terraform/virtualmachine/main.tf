module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}
module "imports" {
  source = "../network"
}

module "storageimport" {
  source = "../storage"
}

#Crear máquina virtual
resource "azurerm_windows_virtual_machine" "moaivm" {
  name = "${modules.global.name}-vm"
  admin_username = var.adminuser
  admin_password = modules.global.name
  location = modules.global.globallocation
  resource_group_name = modules.global.globalname
  network_interface_ids = modules.imports.nic
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
  storage_account_uri = modules.storageimport.storage
    }
}
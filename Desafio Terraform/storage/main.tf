module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

module "nsgimport" {
  source = "../nsg"
}

module "nicimport" {
  source = "../nic"
}

resource "azurerm_network_interface_security_group_association" "moaiconsecnic" {
  network_interface_id      = modules.nicimport.nic
  network_security_group_id = module.nsgimport.nsg
}

resource "azurerm_storage_account" "moaistorage" {
  name                     = "diag${module.imports.name}"
  location                 = modules.global.globallocation
  resource_group_name      = modules.global.globalname
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

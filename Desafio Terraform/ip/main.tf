module "providers" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

module "imports" {
    source = "../virtualmachine"
}
module "networkimport" {
  source = "../network"
}

resource "azurerm_public_ip" "moaiip" {
  name                = "${module.imports.name}--public-ip"
  location            = modules.networkimport.location.location
  resource_group_name = modules.networkimport.location.name
  allocation_method   = "Dynamic"
}
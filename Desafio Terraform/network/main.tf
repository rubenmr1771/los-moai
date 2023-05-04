module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

#Red virtual
resource "azurerm_virtual_network" "moainetwork" {
  name                = "${modules.imports.name}--vnet"
  address_space       = var.direccionip
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname //Se especifica en estas dos lineas donde encontrar la información de la location y el name-
}

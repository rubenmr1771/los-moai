module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

#Red virtual
resource "azurerm_virtual_network" "moainetwork" {
  name                = "${module.imports.name}--vnet"
  address_space       = var.direccionip
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname //Se especifica en estas dos lineas donde encontrar la información de la location y el name-
}
#Conexion del grupo de seguridad a la interfaz de red
resource "azurerm_network_interface_security_group_association" "moaiconsecnic" {
  network_interface_id      = azurerm_network_interface.maoinic
  network_security_group_id = azurerm_network_security_group.moainsg
}

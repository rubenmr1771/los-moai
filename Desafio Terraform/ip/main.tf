module "providers" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

module "imports" {
    source = "../virtualmachine"
}
module "network-import" {
  source = "../network"
}

resource "azurerm_public_ip" "moaiip" {
  name                = "${module.imports.name}--public-ip"
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name
  allocation_method   = "Dynamic"
}
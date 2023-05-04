module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

resource "azurerm_subnet" "moaisubnet" {
  name                = "${module.imports.name}--subnet"
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname
  address_prefixes    = var.subnet
}

module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}
resource "azurerm_public_ip" "moaiip" {
  name                = "${module.global.name}--public-ip"
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname
  allocation_method   = "Dynamic"
}
module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

resource "azurerm_network_security_group" "moainsg" {
  name                = "${module.imports.name}--nsg"
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname 

  security_rule {
    name                       = "RDP"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "*"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "web"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}
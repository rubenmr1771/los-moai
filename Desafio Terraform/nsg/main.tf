module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

module "nicimport" {
  source = "../nic"
}

resource "azurerm_network_security_group" "moainsg" {
  name                = "${modules.imports.name}--nsg"
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

resource "azurerm_network_interface_security_group_association" "moaiconsecnic" {
  network_interface_id      = modules.nicimport.nic
  network_security_group_id = azurerm_network_security_group.moainsg
}
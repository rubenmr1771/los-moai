module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}
module "ipimport" {
    source = "../ip"
}

module "subnetimport" {
  source = "../subnet"
}

module "nsgimport" {
  source = "../nsg"
}

#Interfaz de Red
resource "azurerm_network_interface" "maoinic" {
  name                = "${modules.global.name}--nic"
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname

  ip_configuration {
    name                 = "moai_nic_config"
    subnet_id            = modules.subnetimport.subnet
    private_ip_address   = "Dynamic"
    public_ip_address_id = modules.ipimport.ip
  }
}

resource "azurerm_network_interface_security_group_association" "moaiconsecnic" {
  network_interface_id      = azurerm_network_interface.maoinic
  network_security_group_id = modules.nsgimport.nsg
}

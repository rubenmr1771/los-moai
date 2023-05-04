module "global" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}
module "ipimport" {
    source = "../ip"
}

#Interfaz de Red
resource "azurerm_network_interface" "maoinic" {
  name                = "${modules.global.name}--nic"
  location            = modules.global.globallocation
  resource_group_name = modules.global.globalname

  ip_configuration {
    name                 = "moai_nic_config"
    subnet_id            = azurerm_subnet.moaisubnet
    private_ip_address   = "Dynamic"
    public_ip_address_id = modules.ipimport.ip
  }
}



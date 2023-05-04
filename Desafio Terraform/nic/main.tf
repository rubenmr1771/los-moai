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
module "ipimport" {
    source = "../ip"
}

#Interfaz de Red
resource "azurerm_network_interface" "maoinic" {
  name                = "${module.imports.name}--nic"
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name

  ip_configuration {
    name                 = "moai_nic_config"
    subnet_id            = azurerm_subnet.moaisubnet
    private_ip_address   = "Dynamic"
    public_ip_address_id = modules.ipimport.ip
  }
}



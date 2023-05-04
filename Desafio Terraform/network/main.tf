module "providers" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}
module "imports" {
  source = "../virtualmachine"
}

resource "azurerm_resource_group" "moai" {
  location = var.region //Conectamos al servidor de azure mediante la variable region especificada en el fichero variables
  name     = "Los Moai"
}

#Red virtual
resource "azurerm_virtual_network" "moainetwork" {
  name                = "${module.imports.name}--vnet"
  address_space       = var.direccionip
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name //Se especifica en estas dos lineas donde encontrar la información de la location y el name-
}

#Subnet
resource "azurerm_subnet" "moaisubnet" {
  name                 = "${module.imports.name}--subnet"
  resource_group_name  = azurerm_resource_group.moai.name
  virtual_network_name = azurerm_virtual_network.moainetwork
  address_prefixes     = var.subnet
}

#Creamos IP pública
resource "azurerm_public_ip" "moaiip" {
  name                = "${module.imports.name}--public-ip"
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name
  allocation_method   = "Dynamic"
}

#Reglas de seguridad
resource "azurerm_network_security_group" "moainsg" {
  name                = "${module.imports.name}--nsg"
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name

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

#Interfaz de Red
resource "azurerm_network_interface" "maoinic" {
  name                = "${module.imports.name}--nic"
  location            = azurerm_resource_group.moai.location
  resource_group_name = azurerm_resource_group.moai.name

  ip_configuration {
    name                 = "moai_nic_config"
    subnet_id            = azurerm_subnet.moaisubnet
    private_ip_address   = "Dynamic"
    public_ip_address_id = azurerm_public_ip.moaiip
  }
}

#Conexion del grupo de seguridad a la interfaz de red
resource "azurerm_network_interface_security_group_association" "moaiconsecnic" {
  network_interface_id      = azurerm_network_interface.maoinic
  network_security_group_id = azurerm_network_security_group.moainsg
}

#Cuenta de almacenamiento para diagnósticos de boot
resource "azurerm_storage_account" "moaistorage" {
  name                     = "diag${module.imports.name}"
  location                 = azurerm_resource_group.moai.location
  resource_group_name      = azurerm_resource_group.moai.name
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

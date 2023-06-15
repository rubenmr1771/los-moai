###########################
## Azure Linux VM - Main ##
###########################
//Generación de contraseña aleatoria para las VM
resource "random_password" "linux-vm-password" {
  length           = 16
  min_upper        = 2
  min_lower        = 2
  min_special      = 2
  numeric          = true
  special          = true
  override_special = "!@#$%&"
}

//Generación de secuencia de caracteres aleatoria para los dispositvos.
resource "random_string" "linux-vm-name" {
  length  = 8
  upper   = false
  numeric = false
  lower   = true
  special = false
}

//Creacuón del recurso grupo de seguridad
resource "azurerm_network_security_group" "linux-vm-nsg" {
  depends_on = [data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai]

  name                = "losmoai-${lower(var.environment)}-${random_string.linux-vm-name.result}-nsg"
  location            = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.location
  resource_group_name = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name

  security_rule {
    name                       = "AllowHTTP"
    description                = "Permite el uso del protocolo HTTP"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowSSH"
    description                = "Permite el uso del protocolo SSH"
    priority                   = 150
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "AllowHTTPS"
    description                = "Permite el uso del protocolo seguro HTTPS"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "443"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }

  tags = {
    environment = var.environment

  }
}

//Asociación del recursos NSG con la VM. Permite la aplicación de las reglas de seguridad en la red de las máquinas virtuales.
resource "azurerm_subnet_network_security_group_association" "linux-vm-nsg-association" {
  depends_on = [data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai]

  subnet_id                 = azurerm_subnet.network-subnet.id
  network_security_group_id = azurerm_network_security_group.linux-vm-nsg.id
}

//Creación del recurso IP
resource "azurerm_public_ip" "linux-vm-ip" {
  depends_on = [data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai]

  count               = var.count-number
  name                = "losmoai-${random_string.linux-vm-name.result}-ip-[count.index]"
  location            = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.location
  resource_group_name = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name
  allocation_method   = "Static"

  tags = {
    environment = var.environment
  }
}

//Creación del recurso de la interfaz de red de las VM
resource "azurerm_network_interface" "linux-vm-nic" {
  depends_on = [data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai]

  count               = var.count-number
  name                = "losmoai-${random_string.linux-vm-name.result}-nic-[count.index]"
  location            = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.location
  resource_group_name = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.network-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.linux-vm-ip[count.index].id
  }

  tags = {
    environment = var.environment
  }
}

//Creación de las máquinas virtuales
resource "azurerm_linux_virtual_machine" "linux-vm" {
  depends_on = [azurerm_network_interface.linux-vm-nic]

  count                 = var.count-number
  location              = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.location
  resource_group_name   = data.azurerm_resource_group.rg_FCT_Capgemini_2023_Losmoai.name
  name                  = "losmoai-${random_string.linux-vm-name.result}-vm"
  network_interface_ids = [azurerm_network_interface.linux-vm-nic[count.index].id]
  size                  = var.linux_vm_size

  source_image_reference {
    offer     = var.linux_vm_image_offer_20
    publisher = var.linux_vm_image_publisher
    sku       = var.ubuntu_2004_gen2_sku
    version   = "latest"
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  computer_name  = "losmoai-${random_string.linux-vm-name.result}-vm-[count.index]"
  admin_username = var.linux_admin_username
  admin_password = random_password.linux-vm-password.result

  disable_password_authentication = false

  tags = {
    environment = var.environment
  }
}

# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = var.my_terraform_network_name
  address_space       = var.my_terraform_network_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.my_terraform_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = var.my_terraform_subnet_address_prefixes
}

# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = var.my_terraform_public_ip_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.my_terraform_public_ip_allocation_method
}

# Create Network Security Group and rules
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = var.my_terraform_nsg_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

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

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = var.my_terraform_nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.my_terraform_nic_ip_configuration_name
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = var.my_terraform_nic_ip_configuration_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
  }
}

# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.my_terraform_nic.id
  network_security_group_id = azurerm_network_security_group.my_terraform_nsg.id
}
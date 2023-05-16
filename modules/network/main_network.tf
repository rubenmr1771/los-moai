# Create virtual network
resource "azurerm_virtual_network" "my_terraform_network" {
  name                = var.my_terraform_network_network_name
  address_space       = var.my_terraform_network_network_ip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Create subnet
resource "azurerm_subnet" "my_terraform_subnet" {
  name                 = var.my_terraform_subnet_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.my_terraform_network.name
  address_prefixes     = var.my_terraform_subnet_subnet_prefix
}

# Create public IPs
resource "azurerm_public_ip" "my_terraform_public_ip" {
  name                = var.my_terraform_public_ip_ip_direction
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = var.my_terraform_public_ip_method
}

# Create network interface
resource "azurerm_network_interface" "my_terraform_nic" {
  name                = var.my_terraform_nic_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = var.my_terraform_nic_name_ip_configuration
    subnet_id                     = azurerm_subnet.my_terraform_subnet.id
    private_ip_address_allocation = var.my_terraform_public_ip_method_private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.my_terraform_public_ip.id
  }
}
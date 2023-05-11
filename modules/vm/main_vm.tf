#Gerardo
# Create virtual machine
resource "azurerm_windows_virtual_machine" "maquina_virtual" {
  name                  = var.maquina_virual_name
  admin_username        = var.maquina_virtual_admin
  admin_password        = random_password.password.result
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.my_terraform_nic.id]
  size                  = var.maquina_virtual_size

  os_disk {
    name                 = var.maquina_virtual_os_disk_name
    caching              = var.maquina_virtual_os_disk_caching
    storage_account_type = var.maquina_virtual_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.maquina_virtual_source_image_reference_publisher
    offer     = var.maquina_virtual_source_image_reference_offer
    sku       = var.maquina_virtual_source_image_reference_sku "2022-datacenter-azure-edition"
    version   = var.maquina_virtual_source_image_reference_version "latest"
  }


  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}

# Install IIS web server to the virtual machine
resource "azurerm_virtual_machine_extension" "web_server_install" {
  name                       = var.web_server_install_name "${random_pet.prefix.id}-wsi"
  virtual_machine_id         = azurerm_windows_virtual_machine.main.id
  publisher                  = var.web_server_install_publisher "Microsoft.Compute"
  type                       = var.web_server_install_type "CustomScriptExtension"
  type_handler_version       = var.web_server_install_type_handler_verson "1.8"
  auto_upgrade_minor_version = var.web_server_install_auto_upgrade_minor_version true

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}
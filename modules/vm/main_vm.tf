# Create virtual machine
resource "azurerm_windows_virtual_machine" "main" {
  name                  = var.main_name
  admin_username        = var.main_admin_username
  admin_password        = var.main_admin_password
  location              = var.main_location
  resource_group_name   = var.main_resource_group_name
  network_interface_ids = var.main_network_interface_id
  size                  = var.main_size

  os_disk {
    name                 = var.main_os_disk_name
    caching              = var.main_os_disk_caching
    storage_account_type = var.main_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.main_source_image_reference_publisher
    offer     = var.main_source_image_reference_offer
    sku       = var.main_source_image_reference_sku
    version   = var.main_source_image_reference_version
  }


  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.my_storage_account.primary_blob_endpoint
  }
}

# Install IIS web server to the virtual machine
resource "azurerm_virtual_machine_extension" "web_server_install" {
  name                       = var.web_server_install_name
  virtual_machine_id         = var.web_server_install_virtual_machine_id
  publisher                  = var.web_server_install_virtual_machine_publisher
  type                       = var.web_server_install_virtual_machine_type
  type_handler_version       = var.web_server_install_virtual_machine_type_handler_version
  auto_upgrade_minor_version = var.web_server_install_virtual_machine_auto_upgrader_minor_version

  settings = <<SETTINGS
    {
      "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}

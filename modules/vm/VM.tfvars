# Apartado de config de la maquina virtual ------------------------------------

main_name = "Maquina1"
main_admin_username = "Admin1"
main_admin_password = "Admin1234"
main_location = "eu-wes1"
main_resource_group_name = "grupo_de_recursos_1"
main_network_interface_id = "ens33"
main_size = "Standard_DS1_v2"

# Apartado de config del disco de la maquina virtual -----------------------------------------------

main_os_disk_name = "myOsDisk"
main_os_disk_caching = "ReadWrite"
main_os_disk_storage_account_type = "Premium_LRS"

# Apartado de config de la imagen de SO de la maquina ----------------------------------

main_source_image_reference_publisher = "MicrosoftWindowsServer"
main_source_image_reference_offer = "WindowsServer"
main_source_image_reference_sku = "2022-datacenter-azure-edition"
main_source_image_reference_version = "latest"

# Apartado de config del server web ----------------------------------------------

web_server_install_name = "ServidorWeb1"
web_server_install_virtual_machine_id = "azurerm_windows_virtual_machine.main.id"
web_server_install_virtual_machine_publisher = "Microsoft.Compute"
web_server_install_virtual_machine_type = "CustomScriptExtension"
web_server_install_virtual_machine_type_handler_version = "1.8"
web_server_install_virtual_machine_auto_upgrader_minor_version = "true"


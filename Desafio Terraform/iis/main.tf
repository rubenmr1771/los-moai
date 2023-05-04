module "providers" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

module "imports" {
    source = "../virtualmachine"
}

resource "azurerm_virtual_machine_extension" "moaiiis" {
  name = "${random_pet.randomid}--wsi"
  virtual_machine_id = module.imports.vm
  publisher = var.publisher
  type = "CustomScriptExtension"
  type_handler_version = "1.8"
  auto_upgrade_minor_version = true

  settings = <<SETTINGS
    {
        "commandToExecute": "powershell -ExecutionPolicy Unrestricted Install-WindowsFeature -Name Moai-Web-Server -IncludeAllSubFeature -IncludeManagementTools"
    }
  SETTINGS
}
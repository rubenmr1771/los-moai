module "providers" {
  source = "../"
  providers = {
    azure = azurerm.eu
  }
}

resource "azurerm_resource_group" "moai" {
  location = var.region //Conectamos al servidor de azure mediante la variable region especificada en el fichero variables
  name     = "Los Moai"
}

resource "random_pet" "randomid" {
  prefix = var.prefix
  length = 1
}

resource "random_password" "randompass" {
    length = 20
    min_lower = 1
    min_upper = 1
    min_numeric = 3
    min_special = 3
    special = true  
}
resource "azurerm_resource_group" "moai" {
    location = var.region //Conectamos al servidor de azure mediante la variable region especificada en el fichero variables
    name = "Máquina del grupo Los Moai para el desafio Azure"
}


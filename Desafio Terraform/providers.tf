terraform {
    required_version = ">=1.0" //Versión de Terraform requerida 1.0 o superior.
    
    required_providers { //Proveedores requeridos y sus versiones 3.0 o superior, en este caso.
        azurerm = {
            source = "hashicorp/azurerm"
            version = "~>3.0"
        }
        random = {
            source = "hashicorp/random"
            version = "~>3.0"
        }
    }
}

provider "azurerm" {
    alias  = "eu" //El alias define el nombre de la conexión cuando usamos el código azurerm.alias.
    region = var.region //lee la variable region del fichero variables.
    subscription_id = var.subscripcion //Id de suscripción
    client_id = var.usuario //Id del cliente
    client_secret = var.contrasena //Clave de acceso
    tenant_id = var.invitado //ID de accesps de invitados
}
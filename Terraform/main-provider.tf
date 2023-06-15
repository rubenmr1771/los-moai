############################
## Proveedor Azure - Main ##
############################

//Configuración de Terraform y el proveedor que vamos a utilizar
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
}

//Configuración de las claves de acceso del proveedor. En este caso Azure, las claves se pueden modificar en el fichero tfvars
provider "azurerm" { 
  features {}  
  environment     = "public"
  subscription_id = var.azure-subscription-id
  //client_id       = var.azure-client-id
  //client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}
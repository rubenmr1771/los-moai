############################
## Proveedor Azure - Main ##
############################

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.78.0"
    }
  }
}

provider "azurerm" { 
  features {}  
  environment     = "public"
  subscription_id = var.azure-subscription-id
  //client_id       = var.azure-client-id
  //client_secret   = var.azure-client-secret
  tenant_id       = var.azure-tenant-id
}
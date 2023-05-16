
# Generate random text for a unique storage account name
resource "random_id" "random_id" {
  keepers = {
    # Generate a new ID only when a new resource group is defined
    resource_group = azurerm_resource_group.rg.name
  }

  byte_length = 8
}

resource azurerm_resource_group "rg" {
    name = "${random_pet.prefix.id}-rg"
    location = var.rg_location
} 


resource "random_password" "password" {
  length      = 20
  min_lower   = 1
  min_upper   = 1
  min_numeric = 1
  min_special = 1
  special     = true
}

resource "random_pet" "prefix" {
  prefix = var.prefix
  length = 1
}



module "network" {
  source = "./modules/network"
}

module "vm" {
  source = "./modules/vm"
}


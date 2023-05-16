variable "my_terraform_network_network_name" {
  description = "Nombre de la red virtual"
  type        = string
}

variable "my_terraform_network_network_ip" {
  description = "Espacio de direcciones de la red virtual"
  type        = list(string)
}

variable "my_terraform_subnet_subnet_name" {
  description = "Nombre de la subred"
  type        = string
}

variable "my_terraform_subnet_subnet_prefix" {
  description = "Prefijo de direcciones de la subred"
  type        = list(string)
}

variable "my_terraform_public_ip_ip_direction" {
  description = "Nombre de la IP pública"
  type        = string
}

variable "my_terraform_public_ip_method" {
  description = "Método de asignación de la IP pública"
  type        = string
}

variable "my_terraform_nic_name" {
  description = "Nombre de la interfaz de red"
  type        = string
}

variable "my_terraform_nic_name_ip_configuration" {
  description = "Nombre de la configuración de IP de la interfaz de red"
  type        = string
}

variable "my_terraform_public_ip_method_private_ip_address_allocation" {
  description = "Tipo de asignación de dirección IP privada (Dynamic o Static)"
  type        = string
  }
  
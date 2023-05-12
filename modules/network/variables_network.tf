variable "my_terraform_network_name" {
  type        = string
  description = "Nombre de la red virtual"
}

variable "my_terraform_network_address_space" {
  type        = string
  description = "Rango de direcciones IP"
}

variable "my_terraform_subnet_name" {
  type        = string
  description = "Nombre de la subred"
}

variable "my_terraform_subnet_address_prefixes" {
  type        = string
  description = "Rangos de direcciones IP que se asignarán a la subred"
}

variable "my_terraform_public_ip_name" {
  type        = string
  description = "IP pública"
}

variable "my_terraform_public_ip_allocation_method" {
  type        = string
  description = "Puede ser Dynamic o Static"
}

variable "my_terraform_nsg_name" {
  type        = string
  description = "Nombre para el grupo de seguridad de red"
}

variable "my_terraform_nic_name" {
  type        = string
  description = "Nombre para el NIC de la interfaz de red"
}

variable "my_terraform_nic_ip_configuration_name" {
  type        = string
  description = "Nombre para la conf de IP"
}

variable "my_terraform_nic_ip_configuration_private_ip_address_allocation" {
  type        = string
  description = "Puede ser Dynamic o Static"
}
variable "Nombre_de_la_maquina" {
  default     = "Maquina1"
  description = "Nombre de la maquina."
}

variable "Nombre_del_usuario_administrador" {
  type        = string
  description = "Contiene el nombre que se le dara al usuario administrador"
}

variable "contraseña_del_admin" {
  type        = string
  description = "Contiene la contraseña que se le dara al usuario administrador"
}

variable "resource_group_location" {
  default     = "eastus"
  description = "Location of the resource group."
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}
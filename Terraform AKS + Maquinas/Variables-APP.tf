#############################
## Variables de Aplicación ##
#############################

variable "company" {
  type        = string
  description = "Define el nombre de compañía"
}

variable "app_name" {
  type        = string
  description = "Define el nombre de APP"
}

variable "environment" {
  type        = string
  description = "Define el entorno"
}

variable "location" {
  type        = string
  description = "Región de Azure"
  default     = "West Europe"
}

variable "resource_group_name" {
  type = string
  description = "Nombre del RG"
}

variable "count-number" {
  type = number
  description = "Cuenta de dispositivos a crear"
}
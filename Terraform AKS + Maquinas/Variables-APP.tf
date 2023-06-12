#############################
## Variables de Aplicación ##
#############################

variable "company" {
  type        = string
  description = "This variable defines thecompany name used to build resources"
}

variable "app_name" {
  type        = string
  description = "This variable defines the application name used to build resources"
}

variable "environment" {
  type        = string
  description = "This variable defines the environment to be built"
}

variable "location" {
  type        = string
  description = "Azure region where the resource group will be created"
  default     = "north europe"
}

variable "resource_group_name" {
  type = string
  description = "Resource Group name in Microsoft Azure"
}

variable "count-number" {
  type = number
  description = "Cuenta de dispositivos a crear"
}
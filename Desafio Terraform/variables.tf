variable "region" {
  default     = "eu-west" //Servidor de Azure
  description = "Dirección del servidor Azure donde etá ubicada la máquina"
}

variable "idmaquina" {
  default = "ID" //ID Máquina Virtual
  description = "ID de la máquina de Azure"
}

variable "tipomaquina" {
  default = "Tipo" //Tipo de máquina
  description = "Tipo de máquina"
}

variable "subscripcion" {
  default = "Moai" //ID de subscripción de Azure
  description = "ID de la suscripción"
}

variable "usuario" {
  default = "Moaicapgemini" //Id de Usuario de Azure
  description = "ID del usuario"
}

variable "contrasena" {
  default = "losmoai" //Contraseña de usuario de Azure
  description = "Contraseña de acceso a Azure"
}

variable "invitado" {
  default = "samu" //Id de acceso de invitado a la máquina
  description = "ID de acceso como invitado o tenant a la máquina"
}
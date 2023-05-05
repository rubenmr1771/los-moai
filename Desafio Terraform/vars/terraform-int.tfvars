//Fichero de variables globales
variable "subscripcion" {
  default = "Moai" //ID de subscripción de Azure
  description = "ID de la suscripción"
}

variable "usuario" {
  default = "Moaicapgeminiint" //Id de Usuario de Azure
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

variable "prefijo" {
  type = string
  default = "moai-"
  description = "Prefijo de los nombres de recurso"
}

variable "adminuser" {
  default = "adminint"
  description = "Nombre de cuenta admin"
}

variable "publisher" {
  default = "Microsoft.Compute"
  description = "Publisher de Azure"
}

variable "region" {
  default     = "us-east" //Servidor de Azure
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

variable "direccionip" {
  default = ["10.0.8.0/16"] //Variable dirección IP
  description = "Dirección IP de la red"
}

variable "subnet" {
  default = ["10.0.24.0/24"] //Variable dirección IP de la subnetwork
  description = "Dirección IP de la subnetwork"
}
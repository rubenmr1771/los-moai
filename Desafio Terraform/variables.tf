//Fichero de variables del módulo

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
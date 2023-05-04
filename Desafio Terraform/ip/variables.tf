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

variable "direccionip" {
  default = ["10.0.0.0/16"] //Variable dirección IP
  description = "Dirección IP de la red"
}

variable "subnet" {
  default = ["10.0.1.0/24"] //Variable dirección IP de la subnetwork
  description = "Dirección IP de la subnetwork"
}
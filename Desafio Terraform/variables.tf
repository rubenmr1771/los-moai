variable "adminuser" {
  type = string
  description = "Nombre de cuenta admin"
}

variable "region" {
  type = string
  description = "Dirección del servidor Azure donde etá ubicada la máquina"
}

variable "prefix" {
  type = string
  description = "Prefijo de los nombres de recurso"
}
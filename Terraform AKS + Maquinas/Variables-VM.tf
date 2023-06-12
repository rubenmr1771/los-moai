
##########################
## Azure VM - Variables ##
##########################

variable "linux_vm_size" {
  type        = string
  description = "Tamaño de la Máquina virtual a crear"
}

variable "linux_admin_username" {
  type        = string
  description = "Nombre de usuario de la máquina virtual"
  default     = ""
}

variable "linux_admin_password" {
  type        = string
  description = "Contraseña del admin de la máquina virtual"
  default     = ""
}
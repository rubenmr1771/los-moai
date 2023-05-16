variable "my_storage_account_name" {
    type = string
    description = "Nombre de la cuenta de almacenamiento"
}
variable "maquina_virtual_name" {
    type = string
    description = "variable nombre de la maquina"
}

variable "maquina_virtual_admin_username" {
    type = string
    description = "variable nombre del administrador de la mv"
}

variable "maquina_virtual_admin_password" {
    type = string
    description = "Contraseña del admin"
}

variable "maquina_virtual_size" {
    type = string
    description = "Tamaño de la instancia para manejar cargas de trabajo"
}

variable "maquina_virtual_os_disk_name" {
    type = string
    description = "Nombre del disco del sistema operativo"
}

variable "web_server_install_name" {
    type = string
    description = "Nombre del servidor web IIS"
}
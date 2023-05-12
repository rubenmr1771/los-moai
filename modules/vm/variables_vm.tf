# Apartado de config de la maquina virtual ------------------------------------

variable "main_name" {
  type     = string
  description = "Nombre de la maquina"
}

variable "main_admin_username" {
  type        = string
  description = "Contiene el nombre que se le dara al usuario administrador"
}

variable "main_admin_password" {
  type        = string
  description = "Contiene la contraseña que se le dara al usuario administrador"
}

variable "main_location"{

  type = string
  description = "Contiene la localizacion de la maquina"
}


variable "main_resource_group_name"{

  type = string
  description = "Contiene el nombre del grupo de recursos"
}

variable "main_network_interface_id"{

  type = string
  description = "Contiene el id de la interface de red"
}

variable "main_size"{

  type = string
  description = "Contiene el tamaño de la maquina"
}

# Apartado de config del disco de la maquina virtual -----------------------------------------------
variable "main_os_disk_name"{
  
  type = string 
  description "Contiene el nombre del disco"

}

variable "main_os_disk_caching"{

  type = string 
  description = "Contine el tamaño de cache del disco"
}

variable "main_os_disk_storage_account_type"{

  type = string
  description = "Contiene el tipo de cuenta de almacenamiento"

}

# Apartado de config de la imagen de SO de la maquina ----------------------------------

variable "main_source_image_reference_publisher"{

  type = string 
  description = "Contiene el publisher de la imagen"

}

variable "main_source_image_reference_offer"{

  type = string
  description "Contiene el offer de la imagen"
}
variable "main_source_image_reference_sku"{

  type = string
  description = "Contiene el sku de la imagen"

}
variable "main_source_image_reference_version"{

  type = string
  description = "Contiene la version de la imagen"

}

# Apartado de config del server web ----------------------------------------------

variable "web_server_install_name"{
  
  type = string
  description = "Contiene el nombre del servidor web"

}
variable "web_server_install_virtual_machine_id"{

  type = string
  description = "Contiene el id del server web"

}
variable "web_server_install_virtual_machine_publisher"{

  type = string
  description = "Contiene el publisher del server web"

}
variable "web_server_install_virtual_machine_type"{

  type = string
  description = "Contiene el tipo de servidor web"

}
variable "web_server_install_virtual_machine_type_handler_version"{

  type = string
  description = "Contiene la version del server web"

}
variable "web_server_install_virtual_machine_auto_upgrader_minor_version"{

  type = string
  description = "Contiene el valor de autoupgrader de la versio del server web"

}

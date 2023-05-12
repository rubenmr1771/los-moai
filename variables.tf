variable "rg_location" {
  type        = string
  description = "Localización del grupo de recursos"
}

variable "prefix" {
  type        = string
  default     = "win-vm-iis"
  description = "Prefix of the resource name"
}
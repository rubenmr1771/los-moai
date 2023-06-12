#####################
## Red - Variables ##
#####################

variable "network-vnet-cidr" {
  type        = string
  description = "CIDR de la VNET"
}

variable "network-subnet-cidr" {
  type        = string
  description = "CIDR de la Subnet"
}
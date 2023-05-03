variable "region_1" {
  default     = "eu-north-1"
  description = "AWS North 1 Region"
}

variable "region_1b" {
  default     = "eu-north-1b"
  description = "AWS North 2 Region"
}

variable "region_1c" {
  default = "eu-north-1c"
  description = "AWS North 3 Region"
}

variable "ami" {
    default = "ami-0a6351192ce04d50c"
    description = "Amazon Machine Image ID for Red Hat Linux"
}

variable "type" {
    default = "t3.micro"
    description = "Size of VM"
}
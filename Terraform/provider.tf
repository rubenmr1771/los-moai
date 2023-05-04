provider "aws" {
  alias  = "aws_1"
  region = var.region_1
}

provider "aws" {
  alias  = "aws_2"
  region = var.region_1b
}

provider "aws" {
  alias  = "aws_3"
  region = var.region_1c
}
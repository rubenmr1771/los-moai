resource "aws_instance" "demo" {
  provider      = aws.aws_1
  ami           = var.ami
  instance_type = var.type

  tags = {
    name = "Demo System"
  }
}

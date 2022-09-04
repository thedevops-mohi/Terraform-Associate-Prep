variable "ami" {}
variable "subnet_id" {}
variable "vpc_security_group_ids" {
  type = list(any)
}
variable "identity" {}
resource "aws_instance" "web" {
  ami                    = var.ami
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    "Identity"    = var.identity
    "Name"        = "Student"
    "Environment" = "Training"
  }
}
output "public_ip" {
  value = aws_instance.web.public_ip
}
output "public_dns" {
  value = aws_instance.web.public_dns
}


# Remove the entire block:
#
# resource "aws_instance" "web" { # ...
#}
module "server" {
  source                 = "./server"
  ami                    = var.ami
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  identity               = var.identity
}


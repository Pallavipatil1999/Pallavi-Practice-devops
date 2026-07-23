provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
  resource "aws_instance" "myec2"{
  ami = "ami-0b6d9d3d33ba97d99"

  instance_type = "t3.micro"
  key_name = "id_rsa"
  vpc_security_group_ids = []
  tags = {
    NAme ="myec2"
    name="pallavi"
    env="dev"
  }
  }

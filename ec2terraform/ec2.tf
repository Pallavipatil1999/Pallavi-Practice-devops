terraform{
  backend "s3"{
    bucket =var.mybucket
    region = var.region
    key = "tfstate"
  }
}



provider "aws" {
    region = var.region
    access_key = ""
    secret_key = ""
}
  resource "aws_instance" "myec2"{
  ami = var.ami

  instance_type = "t3.micro"
  key_name = "id_rsa"
  vpc_security_group_ids = ["sg1"]
  tags = {
    NAme ="myec2"
    name="pallavi"
    env="dev"
  }
  }
 
resource "aws_vpc""myvpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="myvpc"
    }
}
resource "aws_subnet" "pub-sub"{
    vpc_id = aws_vpc.myvpc.id
    availability_zone = "us-east-1a"
    cidr_block = "10.0.1.0/24"
    map_customer_owned_ip_on_launch = true
    tags = {
      Name ="pub-sub"

    }
} 
      
    module "myvpc" {
  source = "modules/vpc"
  region = "us-east-1"
  vpc-cidr = var.vpc-cidr
  pub-sub-cidr = var.pub-sub-cidr
  pvt-sub-cidr = var.pvt-sub-cidr
  az1 = var.az1
  az2 = var.az2
  route-cidr = var.route-cidr
}
module "myvpc" {
  source = "modules/vpc"
  region = "us-east-1"
  vpc-cidr = var.vpc-cidr2
  pub-sub-cidr = var.pub-sub-cidr2
  pvt-sub-cidr = var.pvt-sub-cidr2
  az1 = var.az1
  az2 = var.az2
  route-cidr = var.route-cidr
}
module "myinstance" {
  source = "modules/instance"
  ami = var.ami
  instance_type = local.instance_type
  key_name = var.key_name
  mysg = aws_security_group.sg1.id
  instance-name1 = var.instance-name
  subnet = module.myvpc.vpc_id
}
resource "aws_security_group" "sg1" {
  name        = "${var.project}-sg"
  description = "Allow httpd service"
  vpc_id      = aws_vpc.my-vpc.id

  ingress {
    protocol         = "TCP"
    from_port        = 80
    to_port          = 80
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    protocol         = "TCP"
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-sg"
  }
}
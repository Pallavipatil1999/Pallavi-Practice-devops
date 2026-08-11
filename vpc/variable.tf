variable "region" { }
variable "vpc-cidr" {}
variable "pub-sub-cidr" {}

variable "pvt-sub-cidr" {}
variable "az1" {}
variable "az2"{}
variable "route-cidr" {}
variable "project" {
  default     = "pallavi"
  description = "Project name"
}
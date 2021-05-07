provider "aws" {
region = "ap-south-1"
access_key = "your_access_key"
secret_key = "your_secret_key"
}

resource "aws_instance" "OS1byTF" {
ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
tags = {
Name = "MyFirst TF OS"
}
}

provider "aws" {
region = "ap-south-1"
access_key = "AKIAUYW74ABSYNNMVKEJ"
secret_key = "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"
}

resource "aws_instance" "OS1byTF" {
ami = "ami-010aff33ed5991201"
instance_type = "t2.micro"
tags = {
Name = "MyFirst TF OS"
}
}
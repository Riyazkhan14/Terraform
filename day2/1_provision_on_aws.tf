provider "aws" {
    region = "us-east-2"
    access_key = "AKIAUYW74ABS2JIBGRV5"
    secret_key = "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"
  
}
resource "aws_instance" "OS1" {
    ami = "ami-089a545a9ed9893b6"
    instance_type = "t2.small"
    tags = {
      "Name" = "My First Provision using Terraform NEW"

    }
  
}
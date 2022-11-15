provider "aws" {
    region = "us-east-2"
    access_key = "XXXXXXXXXXXXXXXXXXXX"
    secret_key = "XXXXXXXXXXXXXXXXXXXX"
  
}
resource "aws_instance" "OS1" {
    ami = "ami-089a545a9ed9893b6"
    instance_type = "t2.small"
    tags = {
      "Name" = "My First Provision using Terraform NEW"

    }
  
}
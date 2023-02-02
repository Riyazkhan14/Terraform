provider "aws" {
    region = "us-east-2"
    profile = "akhatm"  
}

resource "aws_instance" "web" {
    ami = "ami-089a545a9ed9893b6"
    instance_type = var.mytype  

    tags = {
      "Name" = "MyWebOS"
    }
}
provider "aws" {
    profile = "akhatm"
    region = "us-east-2" 
}

module "mydevm" {
    source = "D:/Installation/DevOps Tutorials/Terraform_work/day9/modules/ec2"
}
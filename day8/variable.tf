variable "region" {
    default = "us-east-2"  
}

variable "profile" {
    default = "akhatm"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnets_cidr" {
    type = list
    default = [ "10.0.1.0/24" , "10.0.2.0/24" ]
}

variable "azs" {
    default = [ "us-east-2a", "us-east-2b" ]  
}
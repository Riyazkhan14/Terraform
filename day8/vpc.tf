resource "aws_vpc" "main" {
  cidr_block       = var.vpc_cidr

  tags = {
    Name = "myFirstVPC"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    "Name" = "MyFirstGW"
  }
}

resource "aws_subnet" "main" {
    count = length(var.subnets_cidr)
    vpc_id = aws_vpc.main.id
    cidr_block = element(var.subnets_cidr, count.index)  
    availability_zone = element(var.azs, count.index)
    map_public_ip_on_launch = true
    tags = {
      "Name" = "Subnet-${count.index + 1 }"
    }
}

resource "aws_route_table" "myRT" {
    vpc_id = aws_vpc.main.id

    route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.igw.id
    } 

    tags = {
      "Name" = "MyPublicRT"
    }
  
}

resource "aws_route_table_association" "a" {
    count = length(var.subnets_cidr)
  subnet_id = element(aws_subnet.main.*.id, count.index)
  route_table_id = aws_route_table.myRT.id
}
provider "aws" {
    region = "us-east-2"
    profile = "akhatm"
}

resource "aws_instance" "os1" {
    ami = "ami-089a545a9ed9893b6"
    instance_type = "t2.micro"
    tags = {
      "Name" = "My First TF OS"
    }
}
output "EC2_Public_Ip_is" {
    value = aws_instance.os1.public_ip
}  

output "Availability_zone" {
  value = aws_instance.os1.availability_zone
  
}

resource "aws_ebs_volume" "ebs_storage" {
  availability_zone = aws_instance.os1.availability_zone
  size = 10
  tags = {
    "Name" = "My First Storage"
  }
  
}

output "EBS_ID" {
  value = aws_ebs_volume.ebs_storage.id  
}
output "EBS_ARN" {
  value = aws_ebs_volume.ebs_storage.arn
  
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id = aws_ebs_volume.ebs_storage.id
  instance_id = aws_instance.os1.id
  
}
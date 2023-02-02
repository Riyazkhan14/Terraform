resource "aws_ebs_volume" "webhdd" {
  availability_zone = aws_instance.webos1.availability_zone
  size = 1

  tags = {
    "Name" = "Storage for Web by TF"
  }
  
}

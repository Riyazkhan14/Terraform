resource "aws_instance" "webos1" {
  ami = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"
  security_groups = [ "default" ]
  key_name = "jenkins"
  tags = {
    "Name" = "Web Server by TF"
  }
}

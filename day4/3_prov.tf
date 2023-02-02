provider "aws" {
    region = "us-east-2"
    profile = "akhatm"   
}

# resource "aws_security_group" "sg_tf" {
#   vpc_id = "vpc-5075ca3b"
#   ingress = [ {
#     cidr_blocks = [ "0.0.0.0/0" ]
#     from_port = 80
#     protocol = "tcp"
#     self = true
#     to_port = 80
#   } ]
  
# }


resource "aws_instance" "webos1" {
  ami = "ami-089a545a9ed9893b6"
  instance_type = "t2.micro"
  security_groups = [ "default" ]
  key_name = "jenkins"
  tags = {
    "Name" = "Web Server by TF"
  }
}

resource "null_resource" "nullremote1" {
connection {
  type = "ssh"
  user = "ec2-user"
  private_key = file("D:/Installation/jenkins.pem")
  host =  aws_instance.webos1.public_ip
}
provisioner "remote-exec" {
  inline = [
    "sudo yum install httpd -y",
    "sudo yum install php -y",
    "sudo systemctl start httpd",
    "sudo systemctl enable httpd"

  ]  
}
}

resource "aws_ebs_volume" "webhdd" {
  availability_zone = aws_instance.webos1.availability_zone
  size = 1

  tags = {
    "Name" = "Storage for Web by TF"
  }
  
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  volume_id = aws_ebs_volume.webhdd.id
  instance_id = aws_instance.webos1.id
  
}

 resource "null_resource" "nullremote2" {
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("D:/Installation/jenkins.pem")
    host = aws_instance.webos1.public_ip
  }
 provisioner "remote-exec" {
  inline = [
    "sudo mkfs.ext4 /dev/xvdc",
    "sudo mount /dev/xvdc /var/www/html"
  ]
 
 }  

 }

 resource "null_resource" "nullremote3" {
  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("D:/Installation/jenkins.pem")
    host = aws_instance.webos1.public_ip
  }
 provisioner "remote-exec" {
  inline = [
    "sudo yum install git -y",
    "sudo git clone https://github.com/Riyazkhan14/PHP.git /var/www/html/web"

  ]
 
 }  
 }

resource "null_resource" "nullresource6" {
   provisioner "local-exec" {
     command = "aws ec2 detach-volume --volume-id vol-0bd7a24c418510e71 --profile akhatm"   
  }

  }


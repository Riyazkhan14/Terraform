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

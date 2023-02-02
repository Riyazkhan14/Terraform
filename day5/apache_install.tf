resource "null_resource" "nullremote1" {
depends_on = [
  aws_volume_attachment.ebs_att
]

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


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

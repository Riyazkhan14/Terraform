provider "aws" {
region = "ap-south-1"
profile = "terraform"
}

resource "aws_instance" "os1" {
    ami = "ami-010aff33ed5991201"
    instance_type = "t2.micro"
    tags = {
        Name = "My Firt TF OS"
    }
    }

    output "my_public_IP" {
        value = aws_instance.os1.public_ip
    }

    output "my_availabiliy_zone_is" {
        value = aws_instance.os1.availability_zone
    }

    #storage Creation
    resource "aws_ebs_volume" "st1" {
        availability_zone = aws_instance.os1.availability_zone
        size = 10
        tags = {
            Name = "New Hard Disk"
        }
    }

output "HDD_Detaisl" {
    value = aws_ebs_volume.st1
}
    # Attach Hard Disk in EC2
resource "aws_volume_attachment" "ebs_att" {
    device_name = "/dev/sdh"
    volume_id = aws_ebs_volume.st1.id
    instance_id = aws_instance.os1.id
}

output "output3" {
    value = aws_volume_attachment.ebs_att
}
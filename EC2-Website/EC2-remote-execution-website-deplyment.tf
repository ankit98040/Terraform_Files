#terraform apply -auto-approve

resource "aws_instance" "webos" {
	ami =                  "ami-063d4ab14480ac177"
	instance_type =        "t2.micro"
	security_groups =      [ "default" ]
	tags = {
		Name = "Webos1"
	}
	key_name =               "key1990"
}



resource "null_resource" "nullremote1"{
	connection {
		type =        "ssh"
		user =        "ec2-user"
		private_key =  file("/Users/ankit/Downloads/key1990.pem")
		host =        aws_instance.webos.public_ip
	}
	provisioner "remote-exec" {
		inline = [
			"sudo yum install httpd -y",
			"sudo yum install php -y",
			"sudo systemctl start httpd"

		]
	}
}



resource "aws_ebs_volume" "example" {
	availability_zone = aws_instance.webos.availability_zone
	size = 10
	tags = {
		Name = "Webserver"
	}
}



resource "aws_volume_attachment" "ebs_att" {
	device_name = "/dev/sdf"
	volume_id = aws_ebs_volume.example.id
	instance_id = aws_instance.webos.id
}



resource "null_resource" "diskattaching"{
	connection {
		type =        "ssh"
		user =        "ec2-user"
		private_key =  file("/Users/ankit/Downloads/key1990.pem")
		host =        aws_instance.webos.public_ip

	}

	provisioner "remote-exec" {
		inline = [
			"sudo mkfs.ext4 /dev/xvdf",
			"sudo mount /dev/xvdf /var/www/html",
			"sudo yum install git -y",
			"sudo git clone https://github.com/vimallinuxworld13/gitphptest /var/www/html/web"
		]
	}
}



resource "null_resource" "website-live"{


	provisioner "local-exec" {
		command =  "chrome http://52.215.235.14/web/"
	}
}
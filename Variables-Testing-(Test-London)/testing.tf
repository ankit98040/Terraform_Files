#terraform apply -auto-approve

resource "aws_instance" "webos" {
	ami =                  lookup(var.image, var.selectami)
	instance_type =        "${var.instancetype}"
	security_groups =      "${var.SG_ids}"
	tags = {
		Name = "Webos1"
	}
	key_name =               "${var.keyname}"
	subnet_id =              "subnet-044f5b84b4da3b517"

	connection {
		type =        "ssh"
		user =        "ec2-user"
		private_key =  file("/Users/ankit/Desktop/TAFZS/PemKeysTest/idv-test-key-pub.pem")
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

output "Instance_ip" {
	value = aws_instance.webos.public_ip
}




resource "aws_ebs_volume" "example" {
	availability_zone = aws_instance.webos.availability_zone
	size = "${var.volumesize}"
	tags = {
		Name = "Webserver"
	}
}


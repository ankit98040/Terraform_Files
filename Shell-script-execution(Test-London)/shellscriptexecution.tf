#terraform apply -auto-approve
#ssh-keygen  -f levelup_key
#ssh -i "levelup_key" ec2-user@ec2-18-130-120-216.eu-west-2.compute.amazonaws.com

resource "aws_key_pair" "levelup_key" {
    key_name = "levelup_key"
    public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "webos" {
	ami =                  lookup(var.image, var.selectami)
	instance_type =        "t2.micro"
	security_groups =      "${var.SG_ids}"
	subnet_id =            "subnet-044f5b84b4da3b517"
	tags = {
		Name = "Webos1"
	}
	key_name =               aws_key_pair.levelup_key.key_name

	provisioner "file" {
		source = "httpdscript.sh"
		destination = "/tmp/httpdscript.sh"
	}

	provisioner "remote-exec" {
		inline = [
			"chmod +x /tmp/httpdscript.sh",
			"sudo /tmp/httpdscript.sh"
		]
	}
	connection {
		type =        "ssh"
		user =        "${var.INSTANCE_USERNAME}"
		private_key =  file(var.PATH_TO_PRIVATE_KEY)
		host =        aws_instance.webos.public_ip
	}
}




resource "aws_ebs_volume" "example" {
	availability_zone = aws_instance.webos.availability_zone
	size = 10
	tags = {
		Name = "Webserver"
	}
}


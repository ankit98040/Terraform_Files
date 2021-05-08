#terraform init->plan->apply->destroy

provider "aws" {
	region = "ap-southeast-1"
	profile = "default"
	
}

#creating ec2
resource "aws_instance" "OS1"{
	ami = "ami-02f26adf094f51167"
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "terra-ami2-os"
		Environment = "terra"
	}
}



output "Public_ip" {
	value = aws_instance.OS1.public_ip
}

output "availabilityzone" {
	value = aws_instance.OS1.availability_zone
}

#creating EBS
resource "aws_ebs_volume" "st1" {
	availability_zone = aws_instance.OS1.availability_zone
	size = 20
	tags = {
		Name = "terravolume"
	}
}
 
output "EBS_Volume" {
	value = aws_ebs_volume.st1
}

#attaching ebs to ec2
resource "aws_volume_attachment" "Ebs_attaching" {
	device_name = "/dev/sdh"
	volume_id = aws_ebs_volume.st1.id
	instance_id = aws_instance.OS1.id
}

provider "aws" {
	region = "ap-southeast-1"
	profile = "default"
	or
	access_key = "AKIL"
	secret_key = "X29leaOD/Bd/QJ5Wew58DxIaq"
}

resource "aws_instance" "OS1"{
	ami = "ami-02f26adf094f51167"
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "terra-ami2-os"
		Environment = "terra"
	}
}


resource "aws_instance" "OS2"{
	ami = "ami-0f86a70488991335e"
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "terra-redhat-os"
		Environment = "terra"
	}
}

output "op1"{
	value = "aws_instance.os1"
}

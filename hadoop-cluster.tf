#creating ec2
resource "aws_instance" "OS1"{
	ami = "ami-02f26adf094f51167"
    vpc_security_group_ids =  ["sg-0f55fdcdf479980b8"] 
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "Hadoop-master"
		Environment = "terra"
	}
}

#creating ec2
resource "aws_instance" "OS2"{
	ami = "ami-02f26adf094f51167"
    vpc_security_group_ids =  ["sg-0f55fdcdf479980b8"]
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "Hadoop-slave"
		Environment = "terra"
	}
}

#creating ec2
resource "aws_instance" "OS3"{
	ami = "ami-02f26adf094f51167"
    vpc_security_group_ids =  ["sg-0f55fdcdf479980b8"]
	instance_type = "t2.micro"
	key_name = "singapore"
	tags = {
		Name = "Hadoop-Slave"
		Environment = "terra"
	}
}

#creating ec2
resource "aws_instance" "OS4"{
	ami = "ami-02f26adf094f51167"
	instance_type = "t2.micro"
    vpc_security_group_ids =  ["sg-0f55fdcdf479980b8"]
	key_name = "singapore"
	tags = {
		Name = "Hadoop-Client"
		Environment = "terra"
	}
}

output "Hadoop-master" {
    value = aws_instance.OS1.public_ip
}
output "Hadoop-slave" {
    value = aws_instance.OS2.public_ip
}
output "hadoop-slave" {
    value = aws_instance.OS3.public_ip
}
output "hadoop-client" {
    value = aws_instance.OS4.public_ip
}


variable "SG_ids" {
	type = list
	default = ["sg-034236f7dcd3dbcb4"]
}

variable "selectami" {}

variable "image" {
	type = map
	default = {
		ami2 = "ami-06dc09bb8854cbde3"
		redhat = "ami-06178cf087598769c"
		ubuntu = "ami-0194c3e07668a7e36"
		windows = "ami-0ae15c1544cd06ac8" 
	}
}

variable "instancetype" {
	type = string
	default = "t2.micro"
}

variable "keyname" {
	type = string
	default = "idv-test-key-pub"
}

variable "volumesize" {
	type = number
	default = 20
}
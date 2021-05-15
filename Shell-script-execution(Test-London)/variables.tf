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

variable "SG_ids" {
	type = list
	default = ["sg-034236f7dcd3dbcb4"]
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "levelup_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "levelup_key.pub"
}

variable "INSTANCE_USERNAME" {
	default = "ec2-user"
}
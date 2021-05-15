variable "x"{
	type = string
	default = "Ankit Pramanik"
}

output  "myvalue"{
	value = "${var.x}"
}

variable "AWS_REGION" {
  default = "ap-south-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "poc"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "poc.pub"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0ed9277fb7eb570c9"
    ap-south-1 = "ami-052cef05d01020f1d"
  }
}

variable "instance-count" {
  default = 1
}

variable "instance_type" {
	type    = string
	default = "t2.micro"
}

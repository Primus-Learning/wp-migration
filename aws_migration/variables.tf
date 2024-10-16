variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default = "ami-0ebf6e3febf87e406"
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default = "t2.micro"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default = "eu-north-1"
}
variable "ami" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0025c36cba2a6c3b9" # "ami-00f251754ac5da7f0" 
}

variable "instance_type" {
  description = "The EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "availability_zone" {
  description = "The availability zone for the subnet"
  type        = string
  default     = "us-east-1a"
}
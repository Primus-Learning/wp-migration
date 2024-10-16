<<<<<<< HEAD

=======
>>>>>>> 899775f (updating tf code)

# VPC
resource "aws_vpc" "wordpress_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "wordpress_vpc"
  }
}

# Subnet
resource "aws_subnet" "wordpress_subnet" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true
}

# Internet Gateway
resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress_vpc.id
}

# Route Table
resource "aws_route_table" "wordpress_route_table" {
  vpc_id = aws_vpc.wordpress_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wordpress_igw.id
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.wordpress_subnet.id
  route_table_id = aws_route_table.wordpress_route_table.id
}

# Security Group
resource "aws_security_group" "wordpress_sg" {
  vpc_id = aws_vpc.wordpress_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2 Instance
resource "aws_instance" "wordpress_instance" {
  ami           = var.ami # Amazon Linux 2 AMI
  instance_type = var.instance_type

  subnet_id              = aws_subnet.wordpress_subnet.id
  security_groups        = [aws_security_group.wordpress_sg.id]
  associate_public_ip_address = true

<<<<<<< HEAD

  # user_data = file("userdata.sh")


=======
  user_data = file("userdata.sh")
>>>>>>> 899775f (updating tf code)

  tags = {
    Name = "bloomscoach-dev"
  }
}
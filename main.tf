provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = { Name = "MyAWSVPC" }
}

resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  map_public_ip_on_launch = true
  tags = { Name = "MyAWSSubnet" }
}

resource "aws_instance" "instances" {
  count         = 3
  ami           = "ami-0b8c6b923777519db"  # Use a valid AMI ID
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.my_subnet.id
  tags = { Name = "Instance-${count.index + 1}" }
}

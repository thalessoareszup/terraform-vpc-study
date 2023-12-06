resource "aws_vpc" "thms-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "networkstudy-one"
  }
}

resource "aws_subnet" "thms-pub-subnet1" {
  vpc_id     = aws_vpc.thms-vpc.id
  cidr_block = "10.0.1.0/24"
  # "on_launch here means when an ec2 instance is launched inside the subnet"
  map_public_ip_on_launch = true

  tags = {
    Name = "networkstudy-pub-subnet1"
  }
}

resource "aws_internet_gateway" "thms-igw" {
  vpc_id = aws_vpc.thms-vpc.id

  tags = {
    Name = "networkstudy-igw1"
  }
}

resource "aws_route_table" "thms-route-table" {
  vpc_id = aws_vpc.thms-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.thms-igw.id
  }

  tags = {
    Name = "networkstudy-rt1"
  }
}

resource "aws_route_table_association" "thms-rta-subnet1" {
  subnet_id      = aws_subnet.thms-pub-subnet1.id
  route_table_id = aws_route_table.thms-route-table.id
}

resource "aws_security_group" "ssh_access" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = aws_vpc.thms-vpc.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
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
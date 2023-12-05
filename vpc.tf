resource "aws_vpc" "thms-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "networkstudy-one"
  }
}

resource "aws_subnet" "thms-pub-subnet1" {
  vpc_id     = aws_vpc.thms-vpc.id
  cidr_block = "10.0.1.0/24"

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

resource "aws_network_interface" "thms-eni" {
  subnet_id   = aws_subnet.thms-pub-subnet1.id
  private_ips = ["10.0.1.10"] 

  tags = {
    Name = "networkstudy-eni"
  }
}
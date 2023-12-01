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
resource "aws_instance" "networkstudy-m1" {
    ami = "ami-0fa1ca9559f1892ec"
    instance_type = "t1.micro"
    subnet_id = aws_subnet.thms-pub-subnet1.id

    tags = {
        Name = "networkstudy-m1"
    }
}
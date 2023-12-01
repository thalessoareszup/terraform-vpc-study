resource "aws_instance" "networkstudy-m1" {
    ami = "ami-0fa1ca9559f1892ec"
    instance_type = "t1.micro"

    tags = {
        Name = "networkstudy-m1"
    }
}
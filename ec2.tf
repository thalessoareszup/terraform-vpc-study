resource "aws_instance" "networkstudy-m1" {
    ami = "ami-0fa1ca9559f1892ec"
    instance_type = "t1.micro"
    subnet_id     = aws_subnet.thms-pub-subnet1.id

    root_block_device {
        volume_type           = "gp2"
        delete_on_termination = true
        volume_size           = 8  # Minimal size in GiB
    }

    tags = {
        Name = "networkstudy-m1"
    }
}
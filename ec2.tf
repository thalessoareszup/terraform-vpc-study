resource "aws_instance" "networkstudy-m1" {
    ami = "ami-0fa1ca9559f1892ec"
    instance_type = "t1.micro"

    network_interface {
        network_interface_id = aws_network_interface.thms-eni.id
        device_index = 0
    }

    root_block_device {
        volume_type           = "gp2"
        delete_on_termination = true
        volume_size           = 8  # Minimal size in GiB
    }

    tags = {
        Name = "networkstudy-m1"
    }
}
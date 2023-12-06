resource "aws_key_pair" "admin" {
  key_name   = "admin-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGC8sAoeqk5b0LILgeX4Mr7kUr11v1JyfWKfC4hOpWuI thales@thm.sh" # Replace with your SSH public key
}

resource "aws_instance" "networkstudy-m1" {
    ami = "ami-0fa1ca9559f1892ec"
    instance_type = "t1.micro"
    key_name               = aws_key_pair.admin.key_name
    vpc_security_group_ids = [aws_security_group.ssh_access.id]
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
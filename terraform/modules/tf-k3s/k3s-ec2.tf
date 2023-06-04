
resource "aws_instance" "k3s-cluster" {
  ami                    = "ami-0329d3839379bfd15"
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "besch-k3s-test-keypair"

  provisioner "file" {
    source      = "./setup_k3s.sh"
    destination = "/tmp/setup_k3s.sh"
  }

  provisioner "remote-exec" {
    inline = ["chmod +x /tmp/setup_k3s.sh", "sudo /tmp/setup_k3s.sh"]
  }

  depends_on = [aws_internet_gateway.gateway]
}
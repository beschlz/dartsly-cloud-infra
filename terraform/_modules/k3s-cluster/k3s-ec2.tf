data "aws_ami" "ec2_master_image" {
  filter {
    name   = "name"
    values = ["dartsly-k3s-master-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  most_recent = true
  owners      = ["self"]
}

resource "aws_instance" "k3s-cluster" {
  ami                    = data.aws_ami.ec2_master_image.id
  instance_type          = "t4g.small"
  subnet_id              = aws_subnet.subnet.id
  vpc_security_group_ids = [aws_security_group.security_group.id]
  key_name               = "besch-k3s-test-keypair"

  depends_on = [aws_internet_gateway.gateway]
}
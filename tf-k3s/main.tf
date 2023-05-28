resource "aws_instance" "k3s" {
  ami = "ami-0288447644a3d0c2b"
  instance_type = "t4g.small"
}
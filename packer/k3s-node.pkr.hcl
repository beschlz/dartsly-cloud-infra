variable "commit_hash" {}

packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "dartsly-k3s-node-${var.commit_hash}"
  instance_type = "t4g.nano"
  region        = "eu-central-1"
  ssh_username = "ubuntu"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-arm64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
}

build {
  name    = "dartsly-k3s-master-${var.commit_hash}"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
}

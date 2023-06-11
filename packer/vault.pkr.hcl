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
  instance_type = "t4g.small"
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
  name    = "dartsly-vault-${var.commit_hash}"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]

    provisioner "shell" {
        inline = [
        "sudo apt-get update -y",
        "sudo apt-get upgrade -y",
        "sudo reboot now",
        "sudo apt install -y gpg"
        ]

        expect_disconnect = true
    }

    provisioner "shell" {
        inline = [
            "sudo install -y vault"
        ]
    }

}


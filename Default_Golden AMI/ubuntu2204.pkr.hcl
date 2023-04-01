packer {
  required_plugins {
    amazon = {
      version = ">= 1.1.1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

locals {
  timestamp     = regex_replace(timestamp(), "[- TZ:]", "")
}

variable "ami_name" {
  type          = string
  default       = "Ubuntu2204 Golden AMI"
  description   = "AMI Name"                     
}

variable "profile" {
  type          = string
  default       = "MFA"
  description   = "Credentials Profile Name"
}

variable "region" {
  type          = string
  default       = "ap-northeast-2"
  description   = "AWS Seoul Region"
}

variable "instance_type" {
  type          = string
  default       = "t3.micro"
  description   = "Instance Type"
}

variable "ssh_username" {
  type          = string
  default       = "ubuntu"
  description   = "SSH User"
}

variable "source_ami" {
  type          = string
  default       = "ami-0e9bfdb247cc8de84"
  description   = "Basic AMI ID - Default : Canonical, Ubuntu, 22.04 LTS, amd64 jammy image build on 2022-09-12"
}

source "amazon-ebs" "default_ubuntu2204" {
  profile                 = "${var.profile}"
  ami_name                = "${var.ami_name}-${local.timestamp}"
  instance_type           = "${var.instance_type}"
  region                  = "${var.region}"
  source_ami              = "${var.source_ami}"
  ssh_username            = "${var.ssh_username}"
}

build {
  name = "AWS"
  sources = [
    "source.amazon-ebs.default_ubuntu2204"
  ]
  provisioner "shell" {
    environment_vars = [
      "FOO=hello world"
    ]
    inline = [
      "echo Default Setting",
      "sudo apt-get remove -y needrestart",
      "sudo apt-get update",
      "sudo apt-get upgrade -y",
      "sudo apt-get install -y awscli",
      "sudo apt-get install -y net-tools"
    ]
  }
  provisioner "shell" {
    inline = ["echo This provisioner runs last"]
  }
}
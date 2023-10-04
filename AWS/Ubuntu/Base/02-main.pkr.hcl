locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  ami_name  = join("-", [var.ami_name, local.timestamp])
}

source "amazon-ebs" "UbuntuServer2204" {
  region         = var.region
  ami_name       = local.ami_name
  instance_type  = var.instance_type
  source_ami     = var.source_ami_id
  user_data_file = "./script-userdatafile.sh"
  ssh_username   = "ubuntu"
  ssh_port       = 10022
  tags = {
    "Name" = local.ami_name
  }
}

build {
  name = "AWS"
  sources = [
    "source.amazon-ebs.UbuntuServer2204"
  ]



  provisioner "file" {
    source      = "./script-provisioner.sh"
    destination = "/tmp/script-provisioner.sh"
  }

  provisioner "shell" {
    inline = [
      "chmod +x /tmp/script-provisioner.sh",
      "echo Start : script-provisioner.sh",
      "/tmp/script-provisioner.sh",
      "echo Stop : script-provisioner.sh"
    ]
  }
  provisioner "shell" {
    inline = [
      "rm -fv /tmp/script-provisioner.sh"
    ]
  }
}
locals {
  timestamp = regex_replace(timestamp(), "[- TZ:]", "")
  ami_name  = join("-", [var.ami_name, local.timestamp])
}

source "amazon-ebs" "AmazonLinux2023" {
  region        = var.region
  ami_name      = local.ami_name
  instance_type = var.instance_type
  source_ami    = var.source_ami_id
  ssh_username  = var.ssh_username
  tags = {
    "Name" = local.ami_name
  }
}

build {
  name = "AWS"
  sources = [
    "source.amazon-ebs.AmazonLinux2023"
  ]

  provisioner "file" {
    source      = "./base-cloud-init.yaml"
    destination = "/tmp/base-cloud-init.yaml"
  }

  provisioner "shell" {
    inline = [
      "sudo yum install -y cloud-init",
      "sudo mv /tmp/base-cloud-init.yaml /etc/cloud/cloud.cfg.d/99_custom.cfg",
      "sudo chown root:root /etc/cloud/cloud.cfg.d/99_custom.cfg",
      "sudo chmod 0644 /etc/cloud/cloud.cfg.d/99_custom.cfg",
      "sudo systemctl enable cloud-init"
    ]
  }
}
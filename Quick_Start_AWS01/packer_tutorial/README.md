# Quick_Start_AWS01
Ref : https://developer.hashicorp.com/packer/tutorials/aws-get-started

## 1. Install Packer
- Packer Download  
    <img src="./Image/InstallPacker.png"  width="65%" height="65%"><br>
    Ref : https://developer.hashicorp.com/packer/downloads

- MAC Example
    ```bash
    wget https://releases.hashicorp.com/packer/1.9.4/packer_1.9.4_darwin_arm64.zip
    unzip packer_1.9.4_darwin_arm64.zip 
    mv ./packer /usr/local/bin/packer 
    ```

- Verify Packer Installation
    ```bash
    packer --version
    1.9.4
    ```
    Ref : https://developer.hashicorp.com/packer/tutorials/aws-get-started/get-started-install-cli

## 2. Build an Image
- File Structure
  ```bash
  mkdir packer_tutorial
  touch packer_tutorial/aws-ubuntu.pkr.hcl
  cd packer_tutorial
  tree
    .
    └── packer_tutorial
        ├── README.md
        └── aws-ubuntu.pkr.hcl
  ```
- aws-ubuntu.pkr.hcl
    ```hcl
    packer {
        required_plugins {
            amazon = {
                version = ">= 1.2.6"
                source  = "github.com/hashicorp/amazon"
            }
        }
    }

    source "amazon-ebs" "ubuntu" {
        ami_name      = "learn-packer-linux-aws"
        instance_type = "t2.micro"
        region        = "ap-northeast-2"
        source_ami_filter {
            filters = {
                name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
                root-device-type    = "ebs"
                virtualization-type = "hvm"
            }
            most_recent = true
            owners      = ["099720109477"]
        }
        ssh_username = "ubuntu"
    }

    build {
        name    = "learn-packer"
        sources = [
            "source.amazon-ebs.ubuntu"
        ]
    } 
    ```
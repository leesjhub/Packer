# Quick_Start_AWS01


## Install Packer
- Packer Download  
    <img src="./Image/InstallPacker.png"  width="80%" height="80%"><br>
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


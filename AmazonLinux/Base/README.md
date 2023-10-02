### Create Image
***1. Initialize Packer configuration***
```bash
$ packer init .  
Installed plugin github.com/hashicorp/amazon v1.2.7 in "/Users/{User}/.config/packer/plugins/github.com/hashicorp/amazon/packer-plugin-amazon_v1.2.7_x5.0_darwin_arm64"
```

***2. Format and validate your Packer template***
```bash
$ pakcer fmt .

$ packer validate aws-ubuntu.pkr.hcl
The configuration is valid.
```

***3. Build Packer image***
```bash
$ packer build aws-ubuntu.pkr.hcl



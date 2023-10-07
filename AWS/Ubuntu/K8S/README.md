### Packer Configure
 - required_plugins : amazon : version = ">= 1.2.6"

### Create Image
***1. Initialize Packer configuration***
```bash
$ packer init .  
Installed plugin github.com/hashicorp/amazon v1.2.7 in "/Users/{User}/.config/packer/plugins/github.com/hashicorp/amazon/packer-plugin-amazon_v1.2.7_x5.0_darwin_arm64"
```

***2. Format and validate your Packer template***
```bash
$ packer validate .
The configuration is valid.

$ pakcer fmt .

```

***3. Build Packer image***
```bash
$ packer build .


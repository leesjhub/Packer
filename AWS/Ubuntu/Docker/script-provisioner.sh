#!/bin/bash

echo "=== Start : script-provisioner.sh ==="
### Install && Update Package
sudo apt-get autoremove -y needrestart
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y awscli
sudo apt-get install -y nvme-cli
sudo apt-get install -y net-tools

### Modify Server Time 
sudo rm -f /etc/localtime
sudo ln -s /usr/share/zoneinfo/Asia/Seoul /etc/localtime

### Modify Cloud-init.cfg
sudo sed -i 's/name: ubuntu/name: sysadmin/g' /etc/cloud/cloud.cfg
sudo sed -i 's/lock_passwd: True/lock_passwd: False/g' /etc/cloud/cloud.cfg
sudo sed -i 's/gecos: Ubuntu/gecos: sysadmin/g' /etc/cloud/cloud.cfg
sudo sed -i 's/ssh_pwauth:   false/ssh_pwauth:   true/g' /etc/cloud/cloud.cfg

### Create User
sudo useradd -u 1020 -m -s /bin/bash sysadmin
echo 'sysadmin:sysadmin' | sudo chpasswd
sudo chage -d 0 sysadmin

echo "=== Stop : script-provisioner.sh ==="
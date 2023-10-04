#!/bin/bash
sudo sed -i 's/#Port 22/Port 10022/g' /etc/ssh/sshd_config
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
sudo systemctl restart sshd
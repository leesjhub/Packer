## 1. Update the apt package index and install packges to use the Kubernetes apt repository :
sudo apt-get install -y apt-transport-https ca-certificates curld 

## 2. Download the public signing key for the Kubernets package repositories. The same signing key is used for all repositories so you can disregard the version in the URL : 
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg

## 3. Add the appropriate apt repository : 
# This overwrites any existing configuration in /etc/apt/sources.list.d/kubernetes.list
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

## 4. Update the apt package index, kubeclet, kubeadm and kubectl, and pin their version : 
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl
sudo apt-mark hold kubelet kubeadm kubectl

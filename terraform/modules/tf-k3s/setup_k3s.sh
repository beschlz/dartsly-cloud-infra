#!/bin/sh

sudo apt update -y && sudo apt upgrade -y

curl -sfL https://get.k3s.io | sh -

# This is necessary to enable kubectl on the vm
# for the production server this should not be necessary, but its nice to have for setting things up
export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"

echo $'\nexport KUBECONFIG=~/.kube/config\n' >> ~/.bashrc;  


# what to do
# cluster is running
# connection cant be established

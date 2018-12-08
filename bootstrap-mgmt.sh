#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get update
sudo apt-get -y upgrade
apt-get -y install software-properties-common
sudo apt-get -y install unzip
apt-get -y install build-essential libssl-dev libffi-dev python-pip python3-pip

# Add graph builder tool for Terraform
sudo apt-get -y install graphviz

# Install Ansible
apt-add-repository -y --update ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# Install Terraform
apt-get update
wget https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip
sudo unzip terraform_0.11.10_linux_amd64.zip -d /usr/local/bin
rm terraform_0.11.10_linux_amd64.zip

# install OpenStack SDK modules
pip install openstacksdk

# Clean up cached packages
apt-get clean all

# update Locale error message
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
sudo update-locale LANG=en_US.UTF-8
#sudo touch /var/lib/cloud/instance/locale-check.skip

# Copy special files into /home/vagrant (from inside the mgmt node)
#cp -a /vagrant/.bash_aliases /home/vagrant
chown -R vagrant:vagrant /home/vagrant
# Preserve original Ansible configuration files
cp /etc/ansible/ansible.cfg /etc/ansible/ansible.cfg.org
cp /etc/ansible/hosts /etc/ansible/hosts.org

# ssh-keygen -t rsa -b 2048
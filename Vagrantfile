# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|

	config.ssh.insert_key = false
	config.vbguest.auto_update = true

      # create Google Cloud Platform Management (mgmt) node
	config.vm.define :terraform_mgmt do |terraform_mgmt_config|
    terraform_mgmt_config.vm.box = "ubuntu/bionic64"
	terraform_mgmt_config.vm.hostname = "terraform-mgmt"
	terraform_mgmt_config.vm.network :private_network, ip: "192.168.56.10"
	terraform_mgmt_config.vm.synced_folder ".", "/home/vagrant/devops101", mount_options: ["dmode=775"]
	terraform_mgmt_config.vm.provider "virtualbox" do |vb|
      	vb.name = "terraform-mgmt"
      	opts = ["modifyvm", :id, "--natdnshostresolver1", "on"]
      	vb.customize opts
      	vb.memory = "1024"
      end
      terraform_mgmt_config.vm.provision :shell, path: "bootstrap-mgmt.sh"
	end

end

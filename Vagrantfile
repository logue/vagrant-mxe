# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts 'Installing vagrant-vbguest Plugin...'
  system('vagrant plugin install vagrant-vbguest')
end

Vagrant.configure("2") do |config|
	config.vm.box = "generic/debian10"

	# @see http://mxe.cc/#requirements
	config.vm.provider "virtualbox" do |v|
		v.memory = 2048
		v.cpus = 4
	end

	# Load custom vbguest installer
    # if defined?(VagrantVbguest::Installers::Debian)
    #    require_relative 'utility/vbg-installer'
    #    config.vbguest.installer = Utility::DebianCustom
    # end

	# mount 
	config.vm.synced_folder "./share", "/home/vagrant/share", create:"true"

	# Initialize virtual machine.
	config.vm.provision "shell", :path => "provision/update.sh", :privileged => true, run: "always"
	config.vm.provision "shell", :path => "provision/init.sh", :privileged => true

	# Setup MXE
	config.vm.provision "shell", :path => "provision/init_mxe.sh", :privileged => false
	config.vm.provision "shell", :path => "provision/update_mxe.sh", :privileged => false, run: "always"

	# finalize
	config.vm.provision "shell", :path => "provision/finally.sh", :privileged => true, run: "always"
end


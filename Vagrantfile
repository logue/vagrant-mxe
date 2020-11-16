# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-vbguest")
  puts 'Installing vagrant-vbguest Plugin...'
  system('vagrant plugin install vagrant-vbguest')
end

Vagrant.configure("2") do |config|
  # Box
  config.vm.box = "debian/contrib-buster64"

  # mount
  if ENV['FIRST_RUN'] == 'true'
    config.vbguest.auto_update = false
  end
  config.vm.synced_folder "./share", "/home/vagrant/share", create: true, type: "virtualbox"

  # @see http://mxe.cc/#requirements
  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--memory", 2048]
    v.memory = 4096
    v.cpus = 8
    # Enable symbolic link to shared foldar
    v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/share", "1"]
  end

  config.vm.provision :shell, inline:<<-EOS
    echo "set grub-pc/install_devices /dev/sda" | debconf-communicate
    apt-get update
    apt-get -y upgrade
EOS
  # Initialize virtual machine.
  config.vm.provision "shell", :path => "provision/update.sh", :privileged => true, run: "always"
  config.vm.provision "shell", :path => "provision/init.sh", :privileged => true

  # Setup MXE
  config.vm.provision "shell", :path => "provision/init_mxe.sh", :privileged => false
  config.vm.provision "shell", :path => "provision/update_mxe.sh", :privileged => false, run: "always"

  # finalize
  config.vm.provision "shell", :path => "provision/finally.sh", :privileged => true, run: "always"
end

# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ogarcia/archlinux-x64"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

   config.vm.provider "virtualbox" do |vb|
     # vb.gui = true
     vb.memory = "1024"
   end

  # Note: I could you ansible provisioner with Vagrant, but later
  # I want to run Ansible natively on my machine.
  config.vm.provision "shell", inline: <<-SHELL
    cd /vagrant/
    # sudo pacman -Syu --noconfirm
    sudo pacman -Sy --noconfirm ansible
    ansible-playbook provisioning/site.yml
  SHELL

end

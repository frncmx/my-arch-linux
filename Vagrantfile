# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "archlinux/archlinux"

  config.vm.provider "virtualbox" do |vb|
      # vb.gui = true
      vb.memory = "1024"
      # Set screen virtual memory to 16MB so that i3
      # can actually start on login when GUI is on.
      vb.customize ["modifyvm", :id, "--vram", "16"]
  end

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo pacman --noconfirm -Syu
    sudo pacman --noconfirm -Sy gvim ansible --needed

    # Add the following line to vagrant user's history... I usally
    # forget how to run a playbook.
    echo "(cd /vagrant && sudo ansible-playbook provisioning/site.yml)" >> ~/.bash_history
  SHELL
end

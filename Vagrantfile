# -*- mode: ruby -*-
# vi: set ft=ruby :

$pacman_conf = <<SCRIPT
cat >> /etc/pacman.conf <<'EOF'
# Repo for simple yaourt install.
[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch
EOF
SCRIPT

Vagrant.configure("2") do |config|
  config.vm.box = "ogarcia/archlinux-x64"

   config.vm.provider "virtualbox" do |vb|
     # vb.gui = true
     vb.memory = "1024"
   end

  config.vm.provision "shell", inline: $pacman_conf

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo pacman --noconfirm -Sy yaourt gvim
         yaourt --noconfirm -Sy ansible-git

    # Add the following line to vagrant user's history... I usally
    # forget how to run a playbook.
    echo "ansible-playbook provisioning/site.yml" > ~/.bash_history
  SHELL
end

# My way of Arching

My choice of Linux: Arch + i3. That combo requires some time to customize;
hone for efficiency.  On the other hand, I don't like to get attached to any
specific HW. Migration should be easy.

So, what is the solution? Automate and store my configurations here.

##  Install Arch Linux base on HW

1. Download Arch Linux .iso
2. `dd` the ISO to a pendrive
`sudo dd bs=4M if=archlinux-[date]-dual.iso of=/dev/sd[letter]`
3. Boot from pendrive
4. Use `wifi-menu` to acces your home WiFi
5. `curl https://raw.githubusercontent.com/frncmx/my-arch-linux/master/first-boot/pre-chroot | bash -`

**Important:** 1st this will be more like a collection of manual notes. But,
hopefully, that will evolve when I have time.

## Testing with Vagrant

1. Install `vagrant`
3. `vagrant up`
3. `vagrant reload`
4. `vagrant snapshot save default clean-provisioned`
4. `vagrant ssh`
5. `history` <= See how to run Ansible.

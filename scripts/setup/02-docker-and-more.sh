# add /usr/sbin to path. some applications like hdparm are installed to sbin so the path needs to have that.
echo 'export PATH=$PATH:/usr/sbin' >> ~/.zshrc

# install docker
curl -fsSL https://get.docker.com | sh

# post install steps for docker on linux
sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

# automount external drive
sudo su <<EOF
echo "PARTUUID=83b83299-8d6f-44d8-8025-8135ded2a2a3 /mnt/ext_drive ext4 defaults,x-systemd.device-timeout=30 0 0" >> /etc/fstab
EOF

# deny virtual interfaces created by docker in dhcpcd
sudo sed -i "1s/^/denyinterfaces veth\*\n/g" /etc/dhcpcd.conf

# cleanup
sudo apt -y autoremove

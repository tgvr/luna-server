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

echo "noarp" >> /etc/dhcpcd.conf
echo "interface eth0" >> /etc/dhcpcd.conf
echo "static ip_address=192.168.0.119/24" >> /etc/dhcpcd.conf
echo "static routers=192.168.0.1" >> /etc/dhcpcd.conf
echo "static domain_name_servers=8.8.8.8 1.1.1.1 8.8.4.4" >> /etc/dhcpcd.conf

echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf
EOF

# deny virtual interfaces created by docker in dhcpcd
sudo sed -i "1s/^/denyinterfaces veth\*\n/g" /etc/dhcpcd.conf

# cleanup
sudo apt -y autoremove

# reload disable ipv6 changes
sudo sysctl -p

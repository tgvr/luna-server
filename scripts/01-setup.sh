# update and upgrade, install necessary utils 
sudo apt update && sudo apt -y upgrade
sudo apt -y install vim curl wget

# install zsh, oh-my-zsh and powerlevel10k
sudo apt -y install zsh
chsh -s $(which zsh)
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's+ZSH_THEME="robbyrussell"+ZSH_THEME="powerlevel10k/powerlevel10k"+g' ~/.zshrc

echo 'export PATH=$PATH:/usr/sbin' >> ~/.zshrc

# install docker
curl -fsSL https://get.docker.com | sh

# post install steps for docker on linux
sudo groupadd docker
sudo usermod -aG docker pi
newgrp docker

# automount external drive
sudo su <<EOF
echo "PARTUUID=83b83299-8d6f-44d8-8025-8135ded2a2a3 /mnt/ext_drive ext4 defaults,noatime,x-systemd.device-timeout=30 0 0" >> /etc/fstab
EOF

# cleanup
sudo apt -y autoremove

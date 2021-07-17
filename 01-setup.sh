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

# install docker
curl -fsSL https://get.docker.com | sh

# cleanup
sudo apt -y autoremove

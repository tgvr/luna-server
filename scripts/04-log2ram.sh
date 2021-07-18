# update and install rsync
sudo apt update && sudo apt -y upgrade
sudo apt install rsync

# download and install log2ram script
wget https://github.com/azlux/log2ram/archive/master.tar.gz -O log2ram.tar.gz
tar xf log2ram.tar.gz
cd log2ram-master
sudo bash install.sh

# cleanup
cd ..
rm -rf log2ram-master
rm log2ram.tar.gz

# configure log2ram
sudo sed -i 's/SIZE=40M/SIZE=128M/g' /etc/log2ram.conf

# print message
echo "PLEASE REBOOT TO APPLY CHANGES"

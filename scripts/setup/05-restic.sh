# run this script as zsh 05-restic.sh

# install restic
sudo apt install -y restic

# set env variables
echo "export RESTIC_REPOSITORY='/mnt/ext_drive/luna_backup'" >> ~/.zshrc
echo "export RESTIC_PASSWORD_FILE='/home/pi/pass/restic'" >> ~/.zshrc
source ~/.zshrc

## initialize a restic repo on /mnt/ext_drive
#restic init --repo $RESTIC_REPOSITORY
#
## backup ~/luna_data to /mnt/ext_drive/luna_backup
#cd ~ && sudo -E restic --verbose backup luna_data && cd -

# restore luna_data from backup on /mnt/ext_drive
sudo -E restic --verbose restore latest --target ~/

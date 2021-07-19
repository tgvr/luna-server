#!/bin/zsh
set -e

# This script was modified from a script on https://webworxshop.com/centralised-backups-with-restic-and-rsync/
# This script should probably be in /etc/cron.weekly
# Make sure the password to the restic repository is in the location mentioned below

######## START CONFIG ########
DISK_UUID="8328b3e4-e48d-47c8-8170-24a8b961a78f"
#GLOBAL_FLAGS="-q"
export RESTIC_REPOSITORY="/mnt/ext_drive/luna_backup"
export RESTIC_PASSWORD_FILE="/home/pi/pass/restic"
######## END CONFIG ########

echo "Starting backup process at $(date '+%Y-%m-%d %H:%M:%S')."

# check for the backup disk, exit if not found
if [ ! -e /dev/disk/by-uuid/$DISK_UUID ]; then
    echo "Backup disk not found!" >&2
    exit 1
fi

# pre-backup check
echo "Performing pre-backup check..."
restic $GLOBAL_FLAGS check

# perform backups
echo "Performing backups..."
cd /home/pi
restic $GLOBAL_FLAGS backup luna_data
# add any other directories here...
cd -

# post-backup check
echo "Performing post backup check..."
restic $GLOBAL_FLAGS check

# clean up old snapshots
echo "Cleaning up old snapshots..."
restic $GLOBAL_FLAGS forget -d 0 -w 4 -m 2 -y 0 --prune

# final check
echo "Performing final backup check..."
restic $GLOBAL_FLAGS check

echo "Backups completed at $(date '+%Y-%m-%d %H:%M:%S')."
exit 0

#!/bin/bash
# this script backs up /home/dylanh its running on to nprbackup
SOURCE="/mnt/homebackup/"
RDIFF_EXCLUDES="--exclude=${SOURCE}/dylanh/Documents/WorkDocuments"
RDIFF_TO_HOST="backup@backup"
RDIFF_TO_BASEDIR="/nprbackup/backups/home/$(hostname)/"
RDIFF_PID_MAX_AGE="60D"
# this path is local!!
mount --bind /home ${SOURCE}

# now rdiff away
rdiff-backup --preserve-numerical-ids --create-full-path --force $SOURCE $RDIFF_TO_HOST::$RDIFF_TO_BASEDIR
rdiff-backup --force --remove-older-than ${RDIFF_PID_MAX_AGE} $RDIFF_TO_HOST::$RDIFF_TO_BASEDIR

umount ${SOURCE}

#!/bin/bash
# this script backs up the host its running on to jarvis
SOURCE="/mnt/backup/"
if [ ! -d $SOURCE ]; then
	mkdir -p ${SOURCE}
fi

RDIFF_EXCLUDES="--exclude-sockets --exclude-fifos --exclude=${SOURCE}/proc/* --exclude=${SOURCE}/var/log/*gz --include=/var/tmp/*/.keep*
                --exclude=${SOURCE}/sys/* --exclude=${SOURCE}/usr/portage/* --exclude=${SOURCE}/var/tmp/* --exclude=${SOURCE}/var/spool/trustlogo/tmp/*
                --exclude=${SOURCE}/var/cache/edb/dep/* --exclude=${SOURCE}/home/sites/[^.]* --exclude=${SOURCE}/etc/apache2/ocsp/*
                --exclude=${SOURCE}/var/lib/mysql/* --include=/var/www/repos --include=/var/www/localhost/htdocs/cacti --exclude=${SOURCE}/var/www/[drlW]* --exclude=${SOURCE}/tmp/*
                --exclude=${SOURCE}/var/log/apache2/* --exclude=${SOURCE}/var/log/nginx/*  --exclude=${SOURCE}/usr/src/* --exclude=${SOURCE}/var/cache/apache2/*
                --exclude=${SOURCE}/mnt/backup/DBbackup/*sql?.DBdump.[0-9]* --exclude=${SOURCE}/var/lib/pgsql/data/* --exclude=${SOURCE}/*/.maildir/.big
                --exclude=${SOURCE}/var/spool/smtpd/.spamassassin/* --exclude=${SOURCE}/var/lib/postgresql/data/* --exclude=${SOURCE}/mnt/pgsql/*/*
                --exclude=${SOURCE}/var/cache/eaccelerator-php*/* --exclude=${SOURCE}/var/log/tomcat-*/* --exclude=${SOURCE}/u0*/* --exclude=${SOURCE}/home/users/tmp_india
                --exclude=${SOURCE}/usr/local/TRLOGO/modules/* --exclude=${SOURCE}/usr/local/USERTRUST/modules/* --exclude=${SOURCE}/var/log/nessus/*
                --exclude=${SOURCE}/var/hopsurf/comodo/hopsurf/compass/* --exclude=${SOURCE}/home/ftp_user*/* --exclude=${SOURCE}/var/www/hopsurf.com/cache/*
                --exclude=${SOURCE}/opt/nessus/var/nessus/plugins-* --exclude=${SOURCE}/var/lib/geodns/* --exclude=${SOURCE}/var/dnscache/log/main/*
                --exclude=${SOURCE}/home/testlps/* --exclude=${SOURCE}/opt*/jboss-*/server/lps/log/* --exclude=${SOURCE}/var/lib/mongodb*/journal/*
                --exclude=${SOURCE}/opt/apache-tomcat-*/logs/* --exclude=${SOURCE}/var/spool/trustlogo/log/*gz --exclude=${SOURCE}/2012/*
                --exclude=${SOURCE}/root/apache-tomcat-*/logs/* --exclude=${SOURCE}/home/certmanager/*/logs/* --exclude=${SOURCE}/var/lib/tomcat*/logs"
RDIFF_TO_HOST="backup@backup"
RDIFF_TO_BASEDIR="/nprbackup/backups/hosts/$(hostname)/"
RDIFF_PID_MAX_AGE="60D"
# this path is local!!
mount --bind / ${SOURCE}
if [ ! -d ${SOURCE} ]; then
	mkdir -p ${SOURCE}
fi
# now rdiff away
rdiff-backup --preserve-numerical-ids --create-full-path --force $SOURCE $RDIFF_TO_HOST::$RDIFF_TO_BASEDIR
rdiff-backup --force --remove-older-than ${RDIFF_PID_MAX_AGE} $RDIFF_TO_HOST::$RDIFF_TO_BASEDIR

umount ${SOURCE}

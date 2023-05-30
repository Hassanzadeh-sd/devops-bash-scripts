#!/usr/bin/bash

# https://github.com/hassanzadeh-sd/devops-bash-scripts

working_dir="$(dirname ${0})"
source "${working_dir}/base.sh"

BACKUP_DIR="/var/atlassian/application-data/backups/"
DAYS_TO_RETAIN=10
COLLECTOR_PATH=/home/ubuntu/services/node_exporter/text_collector
echo delete_old_backups {status='"success"'} 0 >$COLLECTOR_PATH/delete_old_backups.prom

sleep 300

if [ $(ls $BACKUP_DIR | wc -l) ] >2; then
  find $BACKUP_DIR -maxdepth 1 -type f -ctime +$DAYS_TO_RETAIN -name backup*zip -delete
fi

echo delete_old_backups {status='"success"'} 1 >$COLLECTOR_PATH/delete_old_backups.prom

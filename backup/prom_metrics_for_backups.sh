#!/usr/bin/bash

# https://github.com/hassanzadeh-sd/devops-bash-scripts

echo "# HELP Automatic Backup Directorie's size and properties"
echo "# TYPE directory_information gauge"

TOTAL_BACKUP_COUNT=$(ls /home/automatic_backup/* | uniq | wc -l)
echo automatic_backups_total_count {directory='"automatic_backup"'} $TOTAL_BACKUP_COUNT

CONFLUENCE_BACKUP_COUNT=$(ls /home/automatic_backup/confluence* | uniq | wc -l)
echo automatic_backups_confluence_count {directory='"automatic_backup"'} $CONFLUENCE_BACKUP_COUNT

JIRA_BACKUP_COUNT=$(ls /home/automatic_backup/jira* | uniq | wc -l)
echo automatic_backups_jira_count {directory='"automatic_backup"'} $JIRA_BACKUP_COUNT

FILES=$(du -s /home/automatic_backup/*)

SIZE_FLAG=1
BACKUP_SIZE=""
BACKUP_NAME=""
for object in $FILES; do
    if [ $SIZE_FLAG == 1 ]; then
        SIZE_FLAG=0
        BACKUP_SIZE=$object
    else
        SIZE_FLAG=1
        BACKUP_NAME=$(echo ${object##*/})
        echo automatic_backup_size {backup='"'$BACKUP_NAME'"'} $BACKUP_SIZE
    fi
done

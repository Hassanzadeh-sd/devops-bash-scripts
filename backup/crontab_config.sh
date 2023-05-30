#!/usr/bin/bash

# https://github.com/hassanzadeh-sd/devops-bash-scripts

@weekly /home/services/confluence/delete_old_backup.sh >/tmp/scripts/delete_old_backup.log 2>&1
45 08 * * * /bin/bash -c "/home/services/backup/script/gitea.sh" >/tmp/scripts/gitea.log 2>&1
00 00 */2 * * /bin/bash -c "/home/services/backup/script/rocketchat.sh" >/tmp/scripts/rocketchat.log 2>&1
30 00 */3 * * /bin/bash -c "/home/services/backup/script/confluence.sh" >/tmp/scripts/confluence.log 2>&1

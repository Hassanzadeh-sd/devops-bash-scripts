
#!/usr/bin/bash

# https://github.com/hassanzadeh-sd/devops-bash-scripts

set -o errexit
set -o pipefail
set -o nounset

RAAMZ='****'
SERVER='user@serverip'
BASE_DIR=$PWD
SERVER_PATH=/home/automatic_backup/
COLLECTOR_PATH=/home/services/monitoring/node-exporter/textfile_collector
| sponge /node_exporter/text_collector/automatic_backup_directory_information.prom
histogram

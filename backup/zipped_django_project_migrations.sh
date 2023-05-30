#!/usr/bin/bash

# https://github.com/hassanzadeh-sd/devops-bash-scripts

### backup from all migration files
###
### Usage:
###   ./zip_migrations.sh app1 app2 app3 app4

set -o errexit
set -o pipefail
set -o nounset

working_dir="$(dirname ${0})"
GREEN='\033[01;32m'

echo -e "\e[37mINFO\e[0m: createing migration archives ..."

for f in "$@"; do
  tar -cf $working_dir/project_migration_${f}.tar ${f}/migrations/*.py
done

echo -e "\e[37mINFO\e[0m: compress all migrations to single file ..."
tar -cf $working_dir/full_backup_migrations_$(date +"%m_%d_%Y").tar $working_dir/project_migration_*

echo -e "\e[37mINFO\e[0m: remove extra tar files"
sudo rm $working_dir/project_migration_*.tar

echo -e "\e[32mSUCCESS\e[0m: your backup file is ready now :) in $working_dir/full_backup_migrations_$(date +"%m_%d_%Y").tar"

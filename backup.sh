#!/bin/bash

# Directory to backup
backup_dir="/var/lib/docker/volumes/mayan_app/_data"
backup_to="/backups"

# Change Directory
cd "$backup_dir"

# Current date in the format YYYY-MM-DD
current_date=$(date +%F)

# Zip file name
zip_file="mayan_media_${current_date}.zip"

# Backup and zip the directory
zip -r "$backup_to/$zip_file" *

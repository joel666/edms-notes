#!/bin/bash

# Define variables
CONTAINER_NAME="mayan-postgresql-1"
BACKUP_DIR="/backups"
DATE=$(date +"%d-%b-%Y")
DATABASE_NAME="mayan"
BACKUP_FILENAME_DB="${DATABASE_NAME}_pgdump_${DATE}.sql"
BACKUP_FILENAME_MEDIA="mayan_media_${DATE}.tar.gz"

# Media Files
MEDIA_FILES="/var/lib/docker/volumes/mayan_app/_data"

# Create backups directory if it doesn't exist
mkdir -p ${BACKUP_DIR}

# Run pg_dump command inside the container to create backup file
docker exec -t ${CONTAINER_NAME} pg_dumpall -c -U mayan > ${BACKUP_DIR}/${BACKUP_FILENAME_DB}

# Starting Media Backup.
echo 'Starting Media Backup'
cd "$MEDIA_FILES"

# Backup and zip the directory
zip -r "$BACKUP_DIR/$BACKUP_FILENAME_MEDIA" *

# Upload backup files to rclone
rclone copy "$BACKUP_DIR/$BACKUP_FILENAME_DB" drive:/edms-backup/
rclone copy "$BACKUP_DIR/$BACKUP_FILENAME_MEDIA" drive:/edms-backup/

echo 'Backup files uploaded to rclone successfully'

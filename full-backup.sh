#!/bin/bash

# Define variables
CONTAINER_NAME="mayan-postgresql-1"
BACKUP_DIR="/backups"
DATE=$(date +"%d-%b-%Y")
DATABASE_NAME="mayan"
BACKUP_FILENAME="${DATABASE_NAME}_and_media_${DATE}.zip"

# Media Files
MEDIA_FILES="/var/lib/docker/volumes/mayan_app/_data"

# Create backups directory if it doesn't exist
mkdir -p ${BACKUP_DIR}

# Run pg_dump command inside the container to create backup file
docker exec -t ${CONTAINER_NAME} pg_dumpall -c -U mayan > ${BACKUP_DIR}/${DATABASE_NAME}_pgdump_${DATE}.sql

# Starting Media Backup.
echo 'Starting Media Backup'
cd "$MEDIA_FILES"

# Backup and zip the directory
zip -r "$BACKUP_DIR/mayan_media_${DATE}.zip" .

# Zip both the database and media backup files into one file
zip -j "$BACKUP_DIR/$BACKUP_FILENAME" ${BACKUP_DIR}/${DATABASE_NAME}_pgdump_${DATE}.sql "$BACKUP_DIR/mayan_media_${DATE}.zip"

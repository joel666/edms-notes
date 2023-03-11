#!/bin/bash

# Define variables
CONTAINER_NAME="mayan-postgresql-1"
BACKUP_DIR="/backups"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
DATABASE_NAME="mayan"
BACKUP_FILENAME="${DATABASE_NAME}_${TIMESTAMP}.sql"

# Create backups directory if it doesn't exist
mkdir -p ${BACKUP_DIR}

# Run pg_dump command inside the container to create backup file
docker exec -t ${CONTAINER_NAME} pg_dumpall -c -U mayan > ${BACKUP_DIR}/pgdb_dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql
#docker exec -t ${CONTAINER_NAME} pg_dump -U mayan -Fc ${DATABASE_NAME} > /tmp/${BACKUP_FILENAME}

# Copy the backup file from the container to the host machine
#docker cp ${CONTAINER_NAME}:/tmp/${BACKUP_FILENAME} ${BACKUP_DIR}

# Remove the backup file from the container
#docker exec ${CONTAINER_NAME} rm /tmp/${BACKUP_FILENAME}

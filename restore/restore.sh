#!/bin/bash

# AWS S3 Bucket Details
#S3_BUCKET=$S3_BUCKET
S3_BUCKET=del-db-backup/S6/s6rasheedat
BACKUP_File="s6-user-2024-02-08_03-57-01.sql"
#BACKUP_FILE=$BACKUP_FILE
#S3_BUCKET=$S3_BUCKET
# S3_BUCKET_PATH=s3://$S3_BUCKET

# Local Backup File Path
LOCAL_BACKUP_PATH="/tmp/backup_file.dump"

# PostgreSQL Connection Details
DB_USER="$DB_USER"
DB_NAME="$DB_NAME"
DB_HOST="$DB_HOST"
DB_PORT="$DB_PORT"
DB_PASSWORD="$DB_PASSWORD"

AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION

aws configure set aws_access_key_id $AWS_ACCESS_KEY_ID && \
aws configure set aws_secret_access_key $AWS_SECRET_ACCESS_KEY && \
aws configure set default.region $AWS_DEFAULT_REGION && \
aws configure set output json

# Download Backup File from S3
echo "Downloading backup file from S3..."
aws s3 cp s3://$S3_BUCKET/$BACKUP_FILE $LOCAL_BACKUP_PATH

# Check if download was successful
if [ $? -eq 0 ]; then
    echo "Backup file downloaded successfully."
else
    echo "Error: Failed to download backup file from S3."
    exit 1
fi

# Restore Database from Backup
echo "Restoring database from backup..."
PGPASSWORD=$DB_PASSWORD pg_restore -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "$LOCAL_BACKUP_PATH"

# Check if restore was successful
if [ $? -eq 0 ]; then
    echo "Database restored successfully."
else
    echo "Error: Failed to restore database."
    exit 1
fi

echo "Database restore process completed."

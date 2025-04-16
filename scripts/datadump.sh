#!/bin/bash

DATE=$(date +%F)
BACKUP_DIR="../backups"
FILENAME="sales_data_backup_$DATE.sql"

mkdir -p $BACKUP_DIR

mysqldump -u root -p sales sales_data > "$BACKUP_DIR/$FILENAME"

echo " Backup created at $BACKUP_DIR/$FILENAME"



# do this to make it executable
chmod +x scripts/datadump.sh



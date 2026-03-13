#!/bin/bash

DATE=$(date +%Y-%m-%d)

BACKUP_DIR="/backups"
LOGFILE="/backups/backup_verification.log"

# Apache Backup
tar -czvf $BACKUP_DIR/apache_backup_$DATE.tar.gz /etc/httpd /var/www/html

# Nginx Backup
tar -czvf $BACKUP_DIR/nginx_backup_$DATE.tar.gz /etc/nginx /usr/share/nginx/html

echo "Backup completed on $DATE" >> $LOGFILE

# Verify backups
echo "Verifying Apache Backup:" >> $LOGFILE
tar -tzvf $BACKUP_DIR/apache_backup_$DATE.tar.gz >> $LOGFILE

echo "Verifying Nginx Backup:" >> $LOGFILE
tar -tzvf $BACKUP_DIR/nginx_backup_$DATE.tar.gz >> $LOGFILE

echo "------------------------------------" >> $LOGFILE

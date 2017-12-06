#!/bin/bash
duplicity --full-if-older-than 30D --no-encryption /var/www/html/galleries file:///backups/galleries
duplicity remove-older-than 60D --force file:///backups/galleries

duplicity --full-if-older-than 30D --no-encryption /var/www/html/themes file:///backups/themes
duplicity remove-older-than 60D --force file:///backups/themes

duplicity --full-if-older-than 30D --no-encryption /var/www/html/local file:///backups/local
duplicity remove-older-than 60D --force file:///backups/local

duplicity --full-if-older-than 30D --no-encryption /var/www/html/plugins file:///backups/plugins
duplicity remove-older-than 60D --force file:///backups/plugins

duplicity --full-if-older-than 30D --no-encryption /var/www/html/upload file:///backups/upload
duplicity remove-older-than 60D --force file:///backups/upload

mysqldump -u $DB_USER --password='$DB_PASS' -h $DB_HOST $DB_NAME --add-drop-table --add-locks --extended-insert --lock-tables > /backups/dump.sql


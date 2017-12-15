#!/bin/bash
mysql -u $DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME < /backups/dump.sql

duplicity --no-encryption --force file:///backups/galleries /var/www/html/galleries/

duplicity --no-encryption --force file:///backups/themes /var/www/html/themes/

duplicity --no-encryption --force file:///backups/local /var/www/html/local/

duplicity --no-encryption --force file:///backups/plugins /var/www/html/plugins/

duplicity --no-encryption --force file:///backups/upload /var/www/html/upload/


#!/bin/bash
mysql -u $DB_USER --password=$DB_PASS -h $DB_HOST $DB_NAME < /backups/dump.sql

duplicity restore file:///backups/galleries/* /var/www/html/galleries/

duplicity restore file:///backups/themes/* /var/www/html/themes/

duplicity restore file:///backups/local/* /var/www/html/local/

duplicity restore file:///backups/plugins/* /var/www/html/plugins/

duplicity restore file:///backups/upload/* /var/www/html/upload/


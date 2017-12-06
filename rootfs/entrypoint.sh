#!/bin/bash
if [ "$APACHE_SERVER_NAME" != "**NONE**" ]; then
  echo "$APACHE_SERVER_NAME"
  sed -i "1 a ServerName $APACHE_SERVER_NAME:80" etc/apache2/sites-enabled/000-default.conf
fi

if [ ! -d "$APACHE_RUN_DIR" ]; then
  mkdir "$APACHE_RUN_DIR"
  chown $APACHE_RUN_USER:$APACHE_RUN_GROUP "$APACHE_RUN_DIR"
fi

if [ -f "$APACHE_PID_FILE" ]; then
  rm "$APACHE_PID_FILE"
fi

/bin/bash -c "/usr/sbin/apache2ctl -DFOREGROUND"

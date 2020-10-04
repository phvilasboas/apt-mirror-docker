#!/bin/bash
# Refresh mirror every X hours
/etc/init.d/apache2 restart
apt-mirror
echo "Start sleep 6h..."
tail -f /var/log/apache2/access.log

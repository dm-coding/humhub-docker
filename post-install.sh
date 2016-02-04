#!/bin/bash
cd /var/www/html
chmod 755 assets
chmod 755 protected/config/
chmod 755 protected/modules
chmod 755 protected/runtime
chmod 755 -R uploads

chmod 777 protected/yii
chmod 777 protected/yii.bat

chown -R www-data:www-data .
#!/bin/bash
ln -s /etc/apache2/sites-available/app.conf /etc/apache2/sites-enabled/
#cp /var/www/html/.htaccess /var/www/html/dist/fuse/
chmod -R 777 /var/www/html
a2dissite 000-default.conf
a2ensite app.conf
a2enmod rewrite
a2dismod mpm_event && a2enmod mpm_prefork
a2enmod headers
service apache2 restart
npm install
# change here start
LoadModule rewrite_module modules/mod_rewrite.so
# change here end
service apache2 restart
#npm install @angular/cli@8 -g
npm run build
#cp /var/www/html/.htaccess /var/www/html/dist/fuse/
while true; do sleep 1d; done 

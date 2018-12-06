#!/usr/bin/env bash

if [ ! -f /home/vagrant/php ]
then

	yum install -y php72 install php72-php-xml php72-php-pear php72-php-mcrypt php72-php-mbstring php72-php-fpm php72-php-gd php72-php-intl php72-php-soap php72-php-json php72-php-pgsql php72-php-opcachei php72-php-pecl-redis

	chkconfig php-fpm on
	service php-fpm start

	mkdir -p /var/lib/php/session
        chown apache.apache /var/lib/php/session

	service httpd restart

touch /home/vagrant/php
echo "Done!"
else
   echo "Already installed flag set : /home/vagrant/php"
fi


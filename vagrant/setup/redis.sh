#!/usr/bin/env bash

if [ ! -f /home/vagrant/redis ]
then
	yum install -y redis
	chkconfig redis on
	service redis start
	touch /home/vagrant/redis
	echo "Done!"
else
	echo "Already installed flag set : /home/vagrant/redis"
fi

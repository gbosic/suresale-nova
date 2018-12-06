#!/bin/bash

if [ ! -f /home/vagrant/nodejs ]
then
	yum install nodejs
	touch /home/vagrant/nodejs
	echo "Done!"
else
	echo "Already installed flag set : /home/vagrant/nodejs"
fi


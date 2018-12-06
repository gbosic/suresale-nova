!/usr/bin/env bash

if [ ! -f /home/vagrant/postgresql ]
then

	yum install -y https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
	yum -y install postgresql10-server postgresql10-contrib
	systemctl enable postgresql-10.service
	/usr/pgsql-10/bin/postgresql-10-setup initdb
	echo "listen_addresses = '*'" >> /var/lib/pgsql/10/data/postgresql.conf
	echo "host    all             all             0.0.0.0/0               trust" >> /var/lib/pgsql/10/data/pg_hba.conf
	systemctl start postgresql-10.service
	cd /var/lib/pgsql
	sudo -u postgres createuser -DRS suresale
	sudo -u postgres createdb suresale
	sudo -u postgres psql -c "ALTER USER postgres WITH ENCRYPTED PASSWORD 'P@ssw0rd';"
	sudo -u postgres psql -c "ALTER USER suresale WITH ENCRYPTED PASSWORD 'V@grant1';"
	sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE suresale to suresale;"
	
	touch /home/vagrant/postgresql
	echo "Done!"
else
	echo "Already installed flag set : /home/vagrant/postgresql"
fi


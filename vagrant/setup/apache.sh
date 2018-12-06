if [ ! -f /home/vagrant/apache ]
then
    yum -y install httpd
    chown -R apache. /var/www/html/

    (
    echo "<FilesMatch \.php$>"
    echo    "SetHandler \"proxy:fcgi://127.0.0.1:9000\""
    echo "</FilesMatch>"
    ) >> /etc/httpd/conf/httpd.conf


    chkconfig httpd on
    service httpd start

    (
    echo "NameVirtualHost *:80"
    echo "<VirtualHost *:80>"
    echo    "ServerAdmin webmaster@example.com"
    echo    "DocumentRoot /var/www/html/public"
    echo    "ServerName suresaledev"
    echo    "ServerAlias suresaledev"
    echo    "ErrorLog /var/www/html/error.log"
    echo    "CustomLog /var/www/html/access.log combined"
    echo "</VirtualHost>"
    )  >> /etc/httpd/conf/httpd.conf

    sed -i "s/DirectoryIndex index.html/DirectoryIndex index.html index.php/g" /etc/httpd/conf/httpd.conf
    sed -i "s/AllowOverride None/AllowOverride All/g" /etc/httpd/conf/httpd.conf
    sed -i "s/EnableSendfile on/EnableSendfile off/g" /etc/httpd/conf/httpd.conf

    service httpd restart

    touch /home/vagrant/apache
    echo "Done!"
else
    echo "Already installed flag set : /home/vagrant/apache"
fi


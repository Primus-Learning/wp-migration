#!/bin/bash
yum update -y
yum install -y httpd mysql php7.4 php-mysql
systemctl start httpd
systemctl enable httpd
cd /var/www/html
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* .
chown -R apache:apache /var/www/html
systemctl restart httpd
#!/bin/bash

echo "Now Deploying "

#dEPLOY MYSQL DATABASE

apt install mysql-server

#SECURITY configuration

mysql_secure_installation

#improve security

mysql -u root -p




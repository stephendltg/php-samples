#!/bin/bash
# =======
# version: 1
# author: sdeletang
# description: backup mariadb
# =======

docker exec mariadb /usr/bin/mysqldump -u root --password=user database > mariadb.sql
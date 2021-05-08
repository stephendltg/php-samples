#!/bin/bash
# =======
# version: 1
# author: sdeletang
# description: backup mariadb
# =======

docker exec yoonest-db /usr/bin/mysqldump -u root --password=yoonestis100%MAGIC yoonest > yoonest.sql
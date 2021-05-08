#!/bin/bash
# =======
# EPYO
# version: 1
# author: sdeletang
# description: backup mariadb
# =======

docker exec yoonest-db /usr/bin/mysqldump -u root --password=yoonestis100%MAGIC yoonest > backup.sql
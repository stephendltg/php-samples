#!/bin/bash
# =======
# version: 1
# author: sdeletang
# description: restore mariadb
# =======

cat backup.sql | docker exec -i yoonest-db /usr/bin/mysql -u root --password=yoonestis100%MAGIC yoonest

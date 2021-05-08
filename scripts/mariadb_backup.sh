#!/bin/bash
# =======
# EPYO
# version: 1
# author: sdeletang
# description: backup mariadb
# =======

docker exec epyo-db /usr/bin/mysqldump -u root --password=epyois100%MAGIC epyo > backup.sql
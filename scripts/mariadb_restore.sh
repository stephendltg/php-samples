#!/bin/bash
# =======
# EPYO
# version: 1
# author: sdeletang
# description: restore mariadb
# =======

cat backup.sql | docker exec -i epyo-db /usr/bin/mysql -u root --password=epyois100%MAGIC epyo

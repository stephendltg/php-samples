# yoonest-sample

## POST INSTALL

### Install docker

```bash Ubuntu debian linuxMint
sudo sh scripts/install-docker-ubuntu.sh
```

```bash Alpine
sh scripts/install-docker-alpine.sh
```

---

## INSTALL

__Use Makefile:__

```bash
sudo make production
```

or

```bash
sudo docker-compose up -d
```

---

## DATABASE

### BACKUP

```bash
sudo scripts/mariadb_backup.sh
```

### RESTORE

```bash
sudo scripts/mariadb_restore.sh
```

---

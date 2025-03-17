#!/bin/bash

BACKUP_DIR="./backups"
TIMESTAMP=$(date +'%Y%m%d_%H%M%S')

mkdir -p "$BACKUP_DIR"

echo "⏳ Iniciando backup de ownCloud y MariaDB..."

# Backup de la base de datos MariaDB
docker exec owncloud-db mysqldump -u owncloud -powncloudpassword owncloud > "$BACKUP_DIR/db_backup_$TIMESTAMP.sql"

# Backup de los archivos de ownCloud
docker run --rm --volumes-from owncloud -v "$BACKUP_DIR":/backup ubuntu tar czf /backup/owncloud_backup_$TIMESTAMP.tar.gz /mnt/data

echo "✅ Backup completado en $BACKUP_DIR"


ls -1t "$BACKUP_DIR" | tail -n +8 | xargs -I {} rm -f "$BACKUP_DIR"/{}
echo "🧹 Se han eliminado los backups antiguos"
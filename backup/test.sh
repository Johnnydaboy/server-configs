#!/bin/bash

# Define source and destination directories
SRC_DIR="/srv/mergerfs/pool0/vault/Documents/minecraft/test.txt"
DEST_DIR="/srv/mergerfs/pool0/vault/Documents/minecraft"
BACKUP_LIMIT=10

# Get the current date in YYYY-MM-DD format
DATE=$(date +%F_%H-%M-%S)

# Create the destination directory if it doesn't exist
if [ ! -d "$DEST_DIR" ]; then
  mkdir -p "$DEST_DIR"
fi

# Create the backup archive with timestamp
DEST_FILE="$DEST_DIR/minecraft_backup_${DATE}.tar.gz"

# Compress and archive the source directory
tar -czvf "$DEST_FILE" "$SRC_DIR" &

# Print message about successful backup
echo "Backup created: $DEST_FILE"

# Clean up old backups (keep only the latest $BACKUP_LIMIT)
count=0
for file in "$DEST_DIR/"*minecraft_backup_*.tar.gz; do
  if [[ $count -ge $((BACKUP_LIMIT - 1)) ]]; then
    echo "Deleting old backup: $file"
    rm -f "$file"
  fi
  count=$((count+1))
done


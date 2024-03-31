# cd into the scripts dir path
cd "$(dirname "$0")"

# Get current timestamp in YYYY-MM-DD_HH-MM-SS format
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

# Build the backup filename with timestamp
backup_file="wikibackup_${timestamp}.dump"

# Execute docker command for backup
docker exec wikijs_db_1 pg_dump wiki -U wikijs -F c > "$backup_file"

echo "Database backup created: $backup_file"

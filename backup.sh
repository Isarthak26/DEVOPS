SOURCE_DIR="$1"
DEST_DIR="$2"
COMPRESS_FLAG="$3"

LOG_FILE="backup.log"

log_entry() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
}

if [[ ! -d "$SOURCE_DIR" ]]; then
    echo "Source directory $SOURCE_DIR not found."
    log_entry "ERROR: Source directory $SOURCE_DIR not found."
    exit 1
fi

if [[ ! -d "$DEST_DIR" ]]; then
    echo "Creating destination directory: $DEST_DIR..."
    mkdir -p "$DEST_DIR"
    if [[ $? -ne 0 ]]; then
        echo "Could not create destination directory: $DEST_DIR."
        log_entry "ERROR: Could not create destination directory $DEST_DIR."
        exit 1
    fi
    log_entry "INFO: Destination directory $DEST_DIR created."
fi

BACKUP_TIMESTAMP=$(date '+%Y%m%d_%H%M%S')
if [[ "$COMPRESS_FLAG" == "--compress" ]]; then
    BACKUP_FILE="$DEST_DIR/backup_$BACKUP_TIMESTAMP.tar.gz"
    echo "Generating compressed backup at $BACKUP_FILE..."
    tar -czf "$BACKUP_FILE" -C "$SOURCE_DIR" .
    if [[ $? -eq 0 ]]; then
        echo "Backup completed: $BACKUP_FILE"
        log_entry "SUCCESS: Compressed backup created at $BACKUP_FILE."
    else
        echo "Failed to create compressed backup."
        log_entry "ERROR: Compression failed."
        exit 1
    fi
else
    BACKUP_FOLDER="$DEST_DIR/backup_$BACKUP_TIMESTAMP"
    echo "Copying data to $BACKUP_FOLDER..."
    mkdir -p "$BACKUP_FOLDER"
    cp -r "$SOURCE_DIR"/* "$BACKUP_FOLDER/"
    if [[ $? -eq 0 ]]; then
        echo "Backup completed: $BACKUP_FOLDER"
        log_entry "SUCCESS: Files copied to $BACKUP_FOLDER."
    else
        echo "File copying failed."
        log_entry "ERROR: File copying failed."
        exit 1
    fi
fi

echo "Removing backups older than 7 days in $DEST_DIR..."
find "$DEST_DIR" -type f -name "*.tar.gz" -mtime +7 -exec rm -f {} \; 2>> "$LOG_FILE"
find "$DEST_DIR" -type d -name "backup_*" -mtime +7 -exec rm -rf {} \; 2>> "$LOG_FILE"
if [[ $? -eq 0 ]]; then
    echo "Old backups cleaned up."
    log_entry "INFO: Old backups cleaned successfully."
else
    echo "Error while cleaning old backups."
    log_entry "ERROR: Cleanup process encountered issues."
fi

echo "Backup operation finished."
log_entry "INFO: Backup operation completed."


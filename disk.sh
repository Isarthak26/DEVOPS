#!/bin/bash

MAX_USAGE=30  # Renamed threshold to MAX_USAGE
# Extract the disk usage percentage for the root directory ('/')
CURRENT_USAGE=$(df -h | grep ' /$' | awk '{print $5}' | sed 's/%//')  # Removed redundant awk and used sed to strip the '%'

echo "Current disk usage: ${CURRENT_USAGE}%"

if [ "$CURRENT_USAGE" -gt "$MAX_USAGE" ]; then
    echo "Warning: Disk usage is too high: ${CURRENT_USAGE}% (Threshold: ${MAX_USAGE}%)"
    exit 1  # Critical condition, exit with non-zero code
else
    echo "Disk usage is within acceptable limits: ${CURRENT_USAGE}% (Threshold: ${MAX_USAGE}%)"
    exit 0  # Normal condition, exit with zero code
fi


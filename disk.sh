#!/bin/bash

THRESHOLD=20
USAGE=$(df -h | awk '/ \/$/ {gsub("%",""); print $5}')

echo "Current disk usage: ${USAGE}%"

if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "Alert: Disk usage exceeds the threshold: ${USAGE}% (Limit: ${THRESHOLD}%)"
    exit 1
else
    echo "Disk usage is under control: ${USAGE}% (Limit: ${THRESHOLD}%)"
    exit 0
fi

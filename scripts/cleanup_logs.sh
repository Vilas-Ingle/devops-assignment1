#!/bin/bash

# Log directory
LOG_DIR="$HOME/devops-assignment1/logs"

# Number of days to retain logs
RETENTION_DAYS=7

# Cleanup log file
CLEANUP_LOG="$LOG_DIR/log_cleanup.log"

# Start log entry
echo "===== Log Cleanup Started at $(date) =====" >> "$CLEANUP_LOG"

# Check if log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "ERROR: Log directory does not exist: $LOG_DIR" >> "$CLEANUP_LOG"
    exit 1
fi

# Find and delete logs older than retention period
echo "Deleting logs older than $RETENTION_DAYS days:" >> "$CLEANUP_LOG"

find "$LOG_DIR" -type f -name "*.log" -mtime +$RETENTION_DAYS -print -exec rm -f {} \; >> "$CLEANUP_LOG"

# Completion log entry
echo "Cleanup completed at $(date)" >> "$CLEANUP_LOG"
echo "------------------------------------------" >> "$CLEANUP_LOG"

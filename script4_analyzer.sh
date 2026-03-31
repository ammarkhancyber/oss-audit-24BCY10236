#!/bin/bash
# ============================================================
# Script 4: Log File Analyzer
# Author  : Ammar Khan
# Roll No : 24BCY10236
# Course  : Open Source Software (OSS)
# Audit   : Git
# ============================================================
# Concepts: while read loop, command-line arguments $1/$2
#           with defaults, counters, tail, grep,
#           wc, retry mechanism for empty files
# ============================================================

# --- Arguments with defaults ---
LOG_FILE="${1:-/var/log/syslog}"
KEYWORD="${2:-error}"
MAX_RETRIES=3
RETRY_COUNT=0

echo "======================================================"
echo "        OPEN SOURCE AUDIT — LOG FILE ANALYZER         "
echo "======================================================"
echo "  Student  : Ammar Khan | Roll: 24BCY10236"
echo "  Log File : $LOG_FILE"
echo "  Keyword  : '$KEYWORD'"
echo "======================================================"

# --- Validate file existence ---
if [ ! -f "$LOG_FILE" ]; then
    echo ""
    echo "  [ERROR] File not found: $LOG_FILE"
    echo "  Usage : ./script4_analyzer.sh <log_file> <keyword>"
    echo "  Example: ./script4_analyzer.sh /var/log/syslog error"
    echo "======================================================"
    exit 1
fi

# --- Retry mechanism for empty files ---
while [ ! -s "$LOG_FILE" ] && [ "$RETRY_COUNT" -lt "$MAX_RETRIES" ]; do
    RETRY_COUNT=$((RETRY_COUNT + 1))
    echo "  [WARNING] File is empty. Retry $RETRY_COUNT/$MAX_RETRIES in 2 seconds..."
    sleep 2
done

if [ ! -s "$LOG_FILE" ]; then
    echo "  [ERROR] File is still empty after $MAX_RETRIES retries. Exiting."
    exit 1
fi

# --- Parse the log file line by line ---
MATCH_COUNT=0
LINE_NUMBER=0

echo ""
echo "  Scanning log file... please wait."
echo ""

while IFS= read -r line; do
    LINE_NUMBER=$((LINE_NUMBER + 1))
    # Case-insensitive match for keyword
    if echo "$line" | grep -qi "$KEYWORD"; then
        MATCH_COUNT=$((MATCH_COUNT + 1))
    fi
done < "$LOG_FILE"

# --- Display results ---
echo "------------------------------------------------------"
echo "  Total lines scanned : $LINE_NUMBER"
echo "  Matches for '$KEYWORD' : $MATCH_COUNT"
echo "------------------------------------------------------"

if [ "$MATCH_COUNT" -gt 0 ]; then
    echo ""
    echo "  Last 5 matching lines:"
    echo "  ................................................"
    grep -i "$KEYWORD" "$LOG_FILE" | tail -5 | while IFS= read -r matched; do
        echo "    >> $matched"
    done
else
    echo "  No occurrences of '$KEYWORD' found in the log file."
fi

echo ""
echo "======================================================"
echo "  Analysis complete."
echo "======================================================"

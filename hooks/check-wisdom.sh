#!/bin/bash
# Check for new WUWT wisdom to import into compound engineering
# Runs once per day, outputs reminder if new wisdom found

WISDOM_FILE="$HOME/Downloads/wuwt-wisdom-export.json"
PROCESSED_FILE="$HOME/.claude/wisdom-processed.json"
LAST_CHECK_FILE="$HOME/.claude/.wisdom-last-check"

# Only run once per day
TODAY=$(date +%Y-%m-%d)
if [ -f "$LAST_CHECK_FILE" ]; then
    LAST_CHECK=$(cat "$LAST_CHECK_FILE")
    if [ "$LAST_CHECK" = "$TODAY" ]; then
        exit 0
    fi
fi

# Update last check timestamp
echo "$TODAY" > "$LAST_CHECK_FILE"

# Check if wisdom file exists
if [ ! -f "$WISDOM_FILE" ]; then
    exit 0
fi

# Get count of items in wisdom file
TOTAL_ITEMS=$(python3 -c "import json; print(len(json.load(open('$WISDOM_FILE'))['items']))" 2>/dev/null || echo "0")

# Get count of processed items
PROCESSED_COUNT=$(python3 -c "import json; print(len(json.load(open('$PROCESSED_FILE'))['processedIds']))" 2>/dev/null || echo "0")

# If there are new items, output reminder
if [ "$TOTAL_ITEMS" -gt "$PROCESSED_COUNT" ]; then
    NEW_COUNT=$((TOTAL_ITEMS - PROCESSED_COUNT))
    echo "WISDOM IMPORT: Found $NEW_COUNT new wisdom items from WUWT reading. Check ~/Downloads/wuwt-wisdom-export.json and offer to /capture any that apply to engineering (literal or by analogy)."
fi

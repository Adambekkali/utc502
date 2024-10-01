#!/bin/bash

echo "$(date +"%b %d %T") $(hostname) findme[$$]: Searching for >

files=$(find /home -name "FindMe.txt" -type f)

if [ -z "$files" ]; then
    echo "$(date +"%b %d %T") $(hostname) findme[$$]: Can’t find>
else
    echo "$files" | while read -r file; do
        echo "$(date +"%b %d %T") $(hostname) findme[$$]: Found >
        rm -f "$file"
        echo "$(date +"%b %d %T") $(hostname) findme[$$]: Delete>
    done
    echo "$(date +"%b %d %T") $(hostname) findme[$$]: Restarting>
fi

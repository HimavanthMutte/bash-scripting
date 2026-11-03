#!/bin/bash

log_file="zombies.log"


echo "PID PPID COMMAND" > "$log_file"

ps -eao pid,ppid,stat,comm | awk '
BEGIN {
    count = 0 
}

NR > 1 && $3 ~ /^Z/ {
    print $1, $2, $4
    count++
}   

END {
    if (count == 0)
        print "No zombies found"
    else 
        print "Total zombies found - " count
}' >> "$log_file"
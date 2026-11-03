#!/bin/bash

log_file=zombies.log


echo "PID PPID COMMAND" > $log_file

ps -eao pid,ppid,stat,comm | awk '$3=="S" && NR>1
{
    print $1,$2,$4
    found=1
}   END {
        if (!found)
            print "No zombies found"
    }' >> $log_file
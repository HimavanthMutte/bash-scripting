#!/bin/bash

log_file="load_average.log"

if [[ ! -f "$log_file" ]]
then
    echo -e "TIMESTAMP\t\t1_MIN\t5_MIN\t15_MIN" > "$log_file"
fi

timestamp=$(date '+%Y-%m-%d %H:%M:%S')

read load_1 load_5 load_15 _ < /proc/loadavg


echo -e "$timestamp\t$load_1\t$load_5\t$load_15" >> "$log_file"

echo "Load average logged successfully"
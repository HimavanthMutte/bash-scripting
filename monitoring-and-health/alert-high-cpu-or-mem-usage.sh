#!/bin/bash
mem_threshold=${1:-80}
cpu_threshold=${2:-80}

mem_usage=$(free -h | awk 'NR==2{print ($3/$2)*100}')
if [[ $mem_usage -gt $mem_treshold ]]
then
    echo "ALERT: Memory usage is $mem_usage"
fi

cpu_usage=$(mpstat | awk 'NR==4{print 100-$12}')
if [[ $cpu_usage -gt $cpu_treshold ]]
then
    echo "ALERT: CPU usage is $cpu_usage"
fi

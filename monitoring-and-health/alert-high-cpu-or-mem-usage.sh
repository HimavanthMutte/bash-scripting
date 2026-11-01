#!/bin/bash
mem_treshold=80:=$1 


mem_usage=$(free -h | awk 'NR==2{print ($3/$2)*100}')
if [[ $mem_usage -gt 80 ]]
then
    echo "ALERT: Memory usage is $mem_usage"
fi

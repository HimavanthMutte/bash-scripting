#!/bin/bash

while read user
do
    echo $user
done < <(awk -F ":" '$3>1000 {print$1}' /etc/passwd)
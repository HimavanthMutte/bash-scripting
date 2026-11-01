#!/bin/bash

while read user
do
    password_status = $(sudo passwd -S $use | awk '{print $2}')
    echo "$user $password_status"
done < <(awk -F ":" '$3>1000 {print$1}' /etc/passwd)
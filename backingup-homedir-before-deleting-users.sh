#!/bin/bash

file_path=$1

if [[ -z "$file_path" ]]
then
    echo "ERROR: file not provided"
    exit 1
fi

if [[ ! -f "$file_path" ]]
then
    echo "ERROR: file not found"
    exit 1
fi

while read user
do
    if id $user &> /dev/null
    then
        echo "User exists"
    else
        echo "User does not exists...."
    fi
done < $file_path
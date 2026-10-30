#!/bin/bash
if [[ -z $1 ]]
then
    echo "ERROR: Directory Not Provided"
    echo "USAGE: $0 [directory] [age]"
    exit 1
fi
path=$1
age=$2

if ! [[ $age =~ ^[0-9]+$ ]]; then
    echo "ERROR: Days must be a non-negative integer"
    exit 1
fi

if [[ ! -d "$path" ]]
then
    echo "ERROR: Invalid Directory"
    exit 1
fi

echo "Cleaning Files older than $age days in: $path"

find $path -type -f -mtime +"$days" -print

read -r -p "Are you sure you want to delete these files? (y/n): " choice

if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

if [[ $? -eq 0 ]]
then
    echo "Deletion Successful"
    exit 0
else
    echo "ERROR: Issue With Deletion"
    exit 1


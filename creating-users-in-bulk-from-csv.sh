#!/bin/bash

file_path=$1

if [[ -z "$file_path" ]]
then
    echo "ERROR: CSV file not provided"
    exit 1
fi

if [[ ! -f "$file_path" ]]
then
    echo "ERROR: CSV file not found"
    exit 1
fi

{
    read -r header

    while IFS="," read -r username group shell
    do
        echo "Processing user: $username"

        if id "$username" &>/dev/null
        then
            echo "User $username already exists. Skipping..."
            continue
        fi

        if ! getent group "$group" &>/dev/null
        then
            echo "Group $group does not exist. Creating..."

            if ! sudo groupadd "$group"
            then
                echo "ERROR: Failed to create group $group"
                continue
            fi
        fi

        if sudo useradd -m -g "$group" -s "$shell" "$username"
        then
            echo "SUCCESS: User $username created"
        else
            echo "ERROR: Failed to create user $username"
        fi

    done
} < "$file_path"
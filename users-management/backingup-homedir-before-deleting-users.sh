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
    if ! id "$user" &>/dev/null
    then
        echo "User $user does not exist..."
        continue
    fi

    home_dir=$(getent passwd "$user" | awk -F: '{print $6}')

    if [[ ! -d "$home_dir" ]]
    then
        echo "User $user home directory does not exist..."
        continue
    fi

    backup_dir="/backup/user_backups"
    mkdir -p "$backup_dir"
    backup_file="$backup_dir/${user}.tar.gz"

    if tar -czf "$backup_file" -C "$(dirname "$home_dir")" "$(basename "$home_dir")"
    then
        echo "Backup successful for $user"

        if userdel -r "$user"
        then
            echo "User $user deleted successfully"
        else
            echo "Failed to delete user $user"
        fi

    else
        echo "Backup failed for $user. Skipping deletion."
    fi
done < $file_path
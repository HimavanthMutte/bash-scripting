#!/bin/bash

user=$1

groups_file=$2

if [[ -z $user ]]
then
    echo "Did not provide User"
    exit 1
fi

if [[ -z $groups_file ]]
then
    echo "Did not provide file"
    exit 1
fi

if [[ ! -f $groups_file ]]
then
    echo "Did not provide valid file"
    exit 1
fi

if ! id "$user" &>/dev/null
then
    echo "User $user does not exist"
    exit 1
fi

while read group
do
    if ! getnet groups $group &> /dev/null
    then
        echo "Group $group does not exist"
        continue
    fi

    if sudo usermod -aG "$group" "$user"
    then
        echo "Added $user to $group successfully"
    else
        echo "Adding to $group failed"
    fi
done < $groups_file

#!/bin/bash

if ! lastlog -b 90 &>/dev/null
then
    echo "Cannot get users login information"
    exit 1
fi

lastlog -b 90 | awk 'NR>1 {print $1}' | while read -r user
do
    echo "Inactive User - $user"

    uid=$(id -u "$user")

    if [[ $uid -lt 1000 ]]
    then
        echo "Skipping system account: $user (UID: $uid)"
        continue
    fi

    if ! id "$user" &>/dev/null
    then
        echo "User account not found"
        continue
    fi

    if sudo passwd -l "$user"
    then
        echo "Account Locked successfully"
    else
        echo "Failed Locking the Account"
    fi

done

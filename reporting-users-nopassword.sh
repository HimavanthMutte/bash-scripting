
#!/bin/bash

while read -r user
do
    password_status=$(sudo passwd -S "$user" | awk '{print $2}')

    if [[ $password_status == "NP" ]]
    then
        echo "$user"
    fi

done < <(awk -F ":" '$3 >= 1000 {print $1}' /etc/passwd)

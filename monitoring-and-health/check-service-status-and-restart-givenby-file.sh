
#!/bin/bash

services_file=$1

if [[ -z $services_file ]]
then
    echo "File not Provided"
    exit 1
fi

if [[ ! -f $services_file ]]
then
    echo "Invalid File given"
    exit 1
fi

while read service
do
    if ! systemctl is-active --quiet "$service"
    then
        echo "ALERT: $service is not active - attempting to restart"

        if systemctl restart "$service" && systemctl is-active --quiet "$service"
        then
            echo "SUCCESS: $service is restarted and running successfully"
        else
            echo "FAILURE: $service cannot be restarted"
        fi
    else
        echo "SUCCESS: $service is active"
    fi

done < "$services_file"

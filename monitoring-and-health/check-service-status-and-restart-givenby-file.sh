#!/bin/bash

services_file=$1

if [[ -z $services_file ]]
then
    echo "File not Provided"
    exit 1
fi

if [[ -f $service_file ]]
then
    echo "Invalid File given"
    exit 1
fi

while read service
do
    echo $service
done < $services_file
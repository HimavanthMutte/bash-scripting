if [[ -z $1 ]]
then
    echo "ERROR: Directory Not Provided"
    exit 1
fi
path=$1

find $path -type -f -mtime +30 -delete

if [[ $? -eq 0 ]]
then
    echo "Deletion Successful"
    exit 0
else
    echo "ERROR: Issue With Deletion"
    exit 1


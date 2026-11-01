file=$1

if [[ -z $file ]]
then
    echo "ERROR: File not provided"
    exit 1
fi
if [[ ! -f $file ]]
then
    echo "ERROR: Valid File not provided"
    exit 1
fi
while read user
do
    echo "$user"
done < $file
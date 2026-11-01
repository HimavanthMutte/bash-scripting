file_path=$1

if [[ -z $file_path ]]
then 
    echo "ERROR: file_path not given"
    exit 1
fi

{
    read 
while IFS="," read username group shell
do
    id $username &> /dev/null
    if [[ $? -eq 0 ]]
    then
        echo "User Already exists"
    else
        echo "Creating user.... - $username"
    fi
    echo "Assigning group: $group"
    echo "Assigning shell: $shell"
done }< $1
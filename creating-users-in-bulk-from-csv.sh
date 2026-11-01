file_path=$1

if [[ -z $file_path ]]
then 
    echo "ERROR: file_path not given"
    exit 1
fi

while IFS="," read username group shell
do
    echo "Creating user: $username"
    echo "Assigning group: $group"
    echo "Assigning shell: $shell"
done < $1
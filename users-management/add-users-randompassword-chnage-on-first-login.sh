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

while IFS= read -r user || [[ -n $user ]]
do
    if id "$user" &>/dev/null
    then
        echo "User $user already exists"
    else
        sudo useradd -m "$user"

        if [[ $? -eq 0 ]]
        then
            password=$(openssl rand -base64 12)

            echo "$user:$password" | sudo chpasswd

            sudo chage -d 0 "$user"

            echo "User $user created successfully"
            echo "Temporary Password: $password"
        else
            echo "Failed to create user $user"
        fi
    fi
done < "$file"
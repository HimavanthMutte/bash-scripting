while read line
do
    echo "Creating user: $line"
done < "./users.csv"
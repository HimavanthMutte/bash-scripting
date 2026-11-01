
#!/bin/bash

top=${1:-5}
directory=${2:-.}

if [[ ! -d "$directory" ]]; then
    echo "Error: Directory does not exist"
    exit 1
fi

echo "Top $top largest files in $directory"
echo "-----------------------------------"

find "$directory" -type f -exec du -h {} + 2>/dev/null |
sort -hr |
head -n "$top"

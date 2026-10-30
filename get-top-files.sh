
#!/bin/bash

top=${1:-5}
directory=${2:-.}

echo "This script will print top - $top biggest files in given directory"

if [[ ! -d "$directory" ]]; then
    echo "Error: Directory does not exist"
    exit 1
fi

find "$directory" -type f -exec du -h {} + 2>/dev/null |
sort -hr |
head -n "$top"

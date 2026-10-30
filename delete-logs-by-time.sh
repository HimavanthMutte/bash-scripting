
#!/bin/bash

if [[ -z "$1" ]]; then
    echo "ERROR: Directory Not Provided"
    echo "USAGE: $0 [directory] [age] [extension]"
    exit 1
fi

path="$1"
age="${2:-30}"
extension="${3:-.log}"

# Validate age
if ! [[ "$age" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Days must be a non-negative integer"
    exit 1
fi

# Validate directory
if [[ ! -d "$path" ]]; then
    echo "ERROR: Invalid Directory"
    exit 1
fi

echo "Cleaning files older than $age days in: $path"
echo "Extension: $extension"

# Preview matching files
find "$path" -type f -name "*$extension" -mtime +"$age" -print

# Ask for confirmation
read -r -p "Are you sure you want to delete these files? (y/n): " choice

if [[ "$choice" != "y" && "$choice" != "Y" ]]; then
    echo "Cleanup cancelled."
    exit 0
fi

# Delete matching files
if find "$path" -type f -name "*$extension" -mtime +"$age" -delete; then
    echo "Deletion Successful"
    exit 0
else
    echo "ERROR: Issue With Deletion"
    exit 1
fi

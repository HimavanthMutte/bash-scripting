top=${1:-5}
directory=${2:-.}
echo "This script will print top - $top biggest files in given directory"
du -ah $directory | sort -nr | head -n $top > top_files.txt
cat top_files.txt
rm top_files.txt

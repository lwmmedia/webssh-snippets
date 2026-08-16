# Memory pressure plus the 3 biggest RSS processes. Output: 5 aligned lines.
free -h | awk 'NR==2||NR==3 {printf "%-6s %6s used / %6s\n", $1, $3, $2}'
ps -eo rss=,comm= --sort=-rss | head -n 3 \
  | awk '{printf "%-14s %6.0f MB\n", $2, $1/1024}'

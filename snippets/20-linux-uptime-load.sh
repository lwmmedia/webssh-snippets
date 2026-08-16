# Host identity, uptime and load average. Output: 3 aligned lines.
printf "%-7s %s\n" host "$(hostname -s)"
printf "%-7s %s\n" up   "$(uptime -p 2>/dev/null || uptime)"
printf "%-7s %s\n" load "$(cut -d' ' -f1-3 /proc/loadavg)"

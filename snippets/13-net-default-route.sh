# Default gateway plus global IPv4 addresses. Output: 1 gateway line, up to 4 addrs.
ip route show default | awk '{printf "gw %-16s dev %s\n", $3, $5}'
ip -4 -o addr show scope global | awk '{printf "%-8s %s\n", $2, $4}' | head -n 4

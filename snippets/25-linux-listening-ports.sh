# TCP sockets in LISTEN state with the owning program. Output: up to 7 rows.
ss -H -ltnp 2>/dev/null \
  | awk '{n=split($4,a,":"); split($NF,b,"\""); printf "%-7s %s\n", a[n], b[2]}' \
  | sort -n -u | head -n 7

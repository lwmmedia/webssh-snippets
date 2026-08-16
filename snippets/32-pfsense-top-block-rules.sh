# Block rules ranked by matched packets. Output: up to 5 rows, rule id and packets.
pfctl -vvsr 2>/dev/null \
  | awk '/^@[0-9]+ block/{r=$1; next}
         /Evaluations:/{if(r!=""){printf "%-6s %s pkts\n", r, $5; r=""}}' \
  | sort -k2 -rn | head -n 5

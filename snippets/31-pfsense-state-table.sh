# pf state table usage against the configured limit. Output: 2 lines.
pfctl -sm 2>/dev/null | awk '$1=="states"{printf "%-12s %s\n", "limit", $4}'
pfctl -si 2>/dev/null | awk '/current entries/{printf "%-12s %s\n", "in use", $3}'

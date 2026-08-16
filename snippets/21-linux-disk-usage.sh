# Local filesystems ranked by usage. Output: up to 6 rows, mount / use% / free.
df -h -x tmpfs -x devtmpfs -x overlay -x squashfs --output=target,pcent,avail \
  | sed 1d | sort -k2 -rn | head -n 6 \
  | awk '{printf "%-16s %5s %6s free\n", $1, $2, $3}'

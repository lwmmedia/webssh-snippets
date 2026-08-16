# systemd units in failed state. Output: 1 count line plus up to 6 unit names.
systemctl --no-pager --no-legend --plain --failed \
  | awk 'BEGIN{n=0} {n++; if (n<=6) u[n]=$1}
         END{printf "failed units: %d\n", n; for(i=1;i<=n&&i<=6;i++) print "  " u[i]}'

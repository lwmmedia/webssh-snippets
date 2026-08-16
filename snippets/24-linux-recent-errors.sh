# Journal errors from the last hour. Output: 1 count line plus the 5 newest, trimmed.
journalctl --no-pager -q -p err -S -1h -o short 2>/dev/null \
  | awk '{n++; b[n%5]=$0}
         END{printf "errors last 1h: %d\n", n
             for(i=n-4;i<=n;i++) if(i>0) print substr(b[i%5],8,52)}'

# Up/down state of core pfSense daemons. Output: 1 aligned line per daemon.
for s in unbound dhcpd openvpn ntpd sshd; do
  if pgrep -q "$s" 2>/dev/null; then st=up; else st=down; fi
  printf "%-9s %s\n" "$s" "$st"
done

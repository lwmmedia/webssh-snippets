# Public IP seen from outside, 5s cap. Output: 1 line, the address or "no egress".
curl -fsS --max-time 5 https://api.ipify.org 2>/dev/null \
  | awk '{print "egress " $1}' || echo "no egress"

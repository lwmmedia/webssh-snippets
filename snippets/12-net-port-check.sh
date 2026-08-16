# TCP port probe with a 3s cap. Output: 1 line, OPEN or CLOSED plus host:port.
H=192.0.2.10; P=22
timeout 3 bash -c "</dev/tcp/$H/$P" 2>/dev/null \
  && printf "OPEN   %s:%s\n" "$H" "$P" \
  || printf "CLOSED %s:%s\n" "$H" "$P"

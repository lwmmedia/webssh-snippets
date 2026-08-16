# Reachability and latency to one host. Output: 2 lines, loss and min/avg/max ms.
ping -c 4 -W 2 192.0.2.10 | tail -n 2

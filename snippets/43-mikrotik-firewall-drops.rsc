# Drop rules with their packet counters. Output: up to 6 rows, chain and packets.
:local n 0
:foreach r in=[/ip firewall filter find where action=drop] do={
  :if ($n < 6) do={
    :put ([/ip firewall filter get $r chain] . "  " . \
          [/ip firewall filter get $r packets] . " pkts")
    :set n ($n + 1)
  }
}

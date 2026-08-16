# Route table size by kind plus the active default gateway. Output: 4 lines.
:put ("active   " . [:len [/ip route find where active=yes]])
:put ("static   " . [:len [/ip route find where static=yes]])
:put ("dynamic  " . [:len [/ip route find where dynamic=yes]])
:foreach r in=[/ip route find where dst-address="0.0.0.0/0" && active=yes] do={
  :put ("default  " . [/ip route get $r gateway])
}

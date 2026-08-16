# DHCP lease usage on the router. Output: 3 aligned count lines.
:put ("bound    " . [:len [/ip dhcp-server lease find where status=bound]])
:put ("waiting  " . [:len [/ip dhcp-server lease find where status=waiting]])
:put ("total    " . [:len [/ip dhcp-server lease find]])

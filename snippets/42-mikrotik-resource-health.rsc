# CPU load, free memory and uptime. Output: 4 aligned lines.
:put ("cpu      " . [/system resource get cpu-load] . " %")
:put ("mem-free " . ([/system resource get free-memory] / 1048576) . " MB")
:put ("disk-free " . ([/system resource get free-hdd-space] / 1048576) . " MB")
:put ("uptime   " . [/system resource get uptime])

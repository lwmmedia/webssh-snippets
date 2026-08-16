# Running interfaces and their type. Output: 1 short line per running interface.
:foreach i in=[/interface find where running=yes] do={
  :put ([/interface get $i name] . "  " . [/interface get $i type])
}

# Default route plus configured IPv4 interface addresses. Output: up to 5 lines.
netstat -rn -f inet | awk '$1=="default"{printf "%-8s via %s\n", "default", $2}'
ifconfig -u | awk '/^[a-z]/{i=substr($1,1,length($1)-1)}
                   /inet /{printf "%-8s %s\n", i, $2}' | head -n 4

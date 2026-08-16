# Resolve a name with the system resolver. Output: up to 5 unique A records.
getent ahostsv4 example.com | awk '{print $1}' | sort -u | head -n 5

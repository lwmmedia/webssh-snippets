# Monitored gateway health (RTT, loss, status). Output: 1 row per gateway, max 6.
pfSsh.php playback gatewaystatus 2>/dev/null | head -n 6

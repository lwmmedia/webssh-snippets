# System log errors from the last hour. Output: 1 count line plus the 5 newest.
$f = @{ LogName = 'System'; Level = 2; StartTime = (Get-Date).AddHours(-1) }
$e = @(Get-WinEvent -FilterHashtable $f -MaxEvents 50 -ErrorAction SilentlyContinue)
"system errors 1h: {0}" -f $e.Count
$e | Select-Object -First 5 | ForEach-Object {
  '{0:HH:mm} {1,-5} {2}' -f $_.TimeCreated, $_.Id, $_.ProviderName }

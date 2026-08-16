# Automatic services that are not running. Output: 1 count line plus up to 6 names.
$s = Get-Service |
  Where-Object { $_.StartType -eq 'Automatic' -and $_.Status -ne 'Running' }
"auto services stopped: {0}" -f @($s).Count
@($s) | Select-Object -First 6 | ForEach-Object { '  ' + $_.Name }

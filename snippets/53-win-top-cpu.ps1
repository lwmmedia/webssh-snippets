# Top 5 processes by accumulated CPU time. Output: 5 rows, name / CPU s / RAM MB.
Get-Process | Sort-Object CPU -Descending | Select-Object -First 5 |
  ForEach-Object {
    '{0,-15} {1,6:N0}s {2,6:N0}MB' -f `
      $_.ProcessName, $_.CPU, ($_.WorkingSet64 / 1MB) }

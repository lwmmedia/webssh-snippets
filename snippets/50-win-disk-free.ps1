# Fixed volumes with free space. Output: up to 6 rows, drive / free / size.
Get-Volume | Where-Object { $_.DriveType -eq 'Fixed' -and $_.DriveLetter } |
  Select-Object -First 6 | ForEach-Object {
    '{0}: {1,7:N1} GB free of {2,7:N1} GB' -f `
      $_.DriveLetter, ($_.SizeRemaining / 1GB), ($_.Size / 1GB) }

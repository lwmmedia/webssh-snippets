# Locked-out AD accounts under one OU. Output: 1 count line plus up to 6 names.
$ou = 'OU=PLACEHOLDER,DC=example'
$u = @(Search-ADAccount -LockedOut -SearchBase $ou -UsersOnly)
"locked accounts: {0}" -f $u.Count
$u | Select-Object -First 6 | ForEach-Object { '  ' + $_.SamAccountName }

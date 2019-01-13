# DIRECTORY HASHER.

# ALLOW SCRIPT TO RUN FROM ANY DESKTOP.
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass

# PRINT CURRENT DIRECTORY FOR CURRENT USER.
$defaultDir = "C:\Users\$env:UserName\Downloads\"
write-Host `n"Welcome to the directory hasher. Current directory is $defaultDir."

# RETURN LIST OF FILE HASHES FOR ALL FILES IN CURRENT DIRECTORY.
Foreach-Object {
    Get-FileHash "$defaultDir*" | Format-Table -Property Algorithm, Path
    Get-FileHash "$defaultDir*" | Format-Table -Property Hash
}

write-Host `n""

# KEEP POWERSHELL WINDOW OPEN, TO ALLOW COPYING.
PowerShell -NoExit

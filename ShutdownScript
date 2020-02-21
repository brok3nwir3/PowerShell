# END OF DAY CLEAN UP SCRIPT

# ALLOW SCRIPT TO RUN ON THE SYSTEM
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass

# UPDATE POWERSHELL
Update-Module

# EMPTY RECYCLE BIN
Clear-RecycleBin -Force

# CLOSE ALL OPEN PROGRAM WINDOWS
(get-process | ? { $_.mainwindowtitle -ne "" -and $_.processname -ne "powershell" } )| stop-process

# SHUT DOWN THE SYSTEM.
Stop-Computer

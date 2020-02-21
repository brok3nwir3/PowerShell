# -----READGRAB-----
# THIS SCRIPT SCANS A TEXT LOG AND THEN MOVES SPECIFIED FILES TO A NEW FOLDER.

# SET TARGET DIRECTORY OF THE LOG
CD C:\Users\$env:UserName\Desktop\test_logs

# FIND MOST RECENTLY SAVED/MODIFIED LOG AND THEN STORE RESULT TO A VARIABLE
$findRecent = Get-ChildItem -Recurse -ErrorAction SilentlyContinue|
Where {!$_.PsIsContainer}|
Select Name,LastWriteTime|
Sort LastWriteTime -descending|
Select -first 1 Name

# FORMAT VARIABLE RESULT TO BE THE ACTUAL LOG FILE NAME
$temp1 = $findRecent -split '=' | Select -Index 1
$temp2 = $temp1 -split "}"
$targetFile = $temp2

# CREATE A NEW DESKTOP FOLDER FOR STORING THE SPECIFIC FILES LATER
New-Item -Path "C:\Users\$env:UserName\Desktop" -Name "$targetFile Infected" -ItemType "directory"

# SEARCH THE LOG FILE FOR INSTANCES OF A SPECIFIC STRING/S
[string[]]$fileArray = Get-Content -Path .\$targetFile
$a = 0
foreach($line in $fileArray)
{
    # CHECK EACH LINE FOR "INFECTED" OR "SUSPICIOUS"
    if($fileArray[$a] -eq '[Infected]' -or $fileArray[$a] -eq '[Suspicious]'){
        #IF THERE IS A STRING MATCH, THEN CHECK THE LINE ABOVE FOR A FILE PATH
        if($fileArray[$a-1] -match '([a-z]{1}:.*\.[a-z,0-9]{1,3})'){
            $result = [string[]]$matches[1]
            # PLACE THE FILE IN THE NEW DESKTOP FOLDER
            Copy-Item "$result" -Destination "C:\Users\$env:UserName\Desktop\$targetFile Infected"
            }
        }
    $a++
}

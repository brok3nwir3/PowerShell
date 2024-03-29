# BULK HASH LOOKUP

# ALLOW SCRIPT TO RUN FROM ANY DESKTOP
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass

# WELCOME MESSAGE
write-Host `n"Running the bulk hash lookup tool."

# INSTANTIATE ARRAY TO HOLD FILE HASH VALUES
[array]$hashArray = @()

# PROMPT USER FOR INPUT AND ADD USER INPUT TO FILE HASH ARRAY
do {
 $input = (Read-Host "Paste your file hashes here and press enter. Press enter a second time when finished")
 if ($input -ne '') {$hashArray += $input}
}
until ($input -eq '')

# INSTANTIATE SANITIZED ARRAY AND SANITIZE USER INPUTS
[array]$sanitizedArray = @()

foreach ($input in $hashArray) {
    # CLEANSE FOR 0x IDENTIFIER
    if($input.Contains("0x"))
    {
        $input = $input.Replace("0x","")
    }
    # CLEANSE FOR SINGLE QUOTES
    if($input.Contains("'"))
    {
        $input = $input.Replace("'","")
    }
    # PASS CLEANSED HASH VALUES TO SECOND ARRAY
    $sanitizedArray += $input
}

# LAUNCH A VIRUS-TOTAL GOOGLE TAB FOR EVERY HASH SUBMITTED AND APPEND EACH HASH TO THE VIRUS-TOTAL URL STRING
foreach ($input in $sanitizedArray) {
    start-process -FilePath 'C:\Program Files (x86)\Google\Chrome\Application\chrome.exe' -ArgumentList ('https://www.virustotal.com/#/search/' + $input)
}

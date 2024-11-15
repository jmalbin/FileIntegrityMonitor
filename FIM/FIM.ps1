Function Calculate($filepath) {
    $filehash = Get-FileHash -Path $filepath -Algorithm SHA512
    return $filehash
}

Function Erase-Baseline() {
    $baselineExists = Test-Path -Path .\baseline.txt

    if ($baselineExists) {
        #Deletes it
        Remove-Item -Path .\baseline.txt
    }
}

Write-Host ""
Write-Host "What would you like to do?"
Write-Host "A) Collect new Baseline?"
Write-Host "B) Begin monitoring files with saved Baseline?"
Write-Host ""
$response = Read-Host -Prompt "Please enter 'A' or 'B'"
Write-Host ""

Write-Host "User entered $($response)"


if ($response -eq "A".ToUpper()) {
    # Deletes baseline.txt if it already exists
    Erase-Baseline

    # Calculate the hash from the target files and store it in baseline.txt
    # Collect all files in the target folder
    $files = Get-ChildItem -Path .\Files

    # For file, calculate the hash, and write to baseline.txt
    foreach ($f in $files) {
        $hash = Calculate $f.FullName
        "$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\baseline.txt -Append
    }
    Write-Host "A new baseline has been created."
}

elseif ($response -eq "B".ToUpper()) {

    $fileHashDictionary = @{}

    # Load file/hash from baseline.txt and store them in a directory
    $filePathsAndHashes = Get-Content -Path .\baseline.txt

    foreach ($f in $filePathsAndHashes) {
        $fileHashDictionary.add($f.Split("|")[0],$f.Split("|")[1])
    }

    # Begin continuously monitoring files with saved baseline
    while ($true) {
        Start-Sleep -Seconds 1

        $files = Get-ChildItem -Path .\Files

        # For file, calculate the hash, and write to baseline.txt
        foreach ($f in $files) {
            $hash = Calculate $f.FullName
            #"$($hash.Path)|$($hash.Hash)" | Out-File -FilePath .\Desktop\FIM\baseline.txt -Append

            # Notify if a new file has been created
            if ($fileHashDictionary[$hash.Path] -eq $null) {
                # A new file has been created!
                Write-Host "$($hash.Path) has been created!" -ForegroundColor Cyan

            }

            # Notify if a new file has been changed
            if ($fileHashDictionary[$hash.Path] -eq $hash.Hash) {
                # The file has not changed
            }
            else {
                # File has been compromised!  Notify the user
                Write-Host "Alert!  $($hash.Path) has changed!" -ForegroundColor Magenta
            }
        }

        foreach ($key in $fileHashDictionary.Keys) {
            $baselineExists = Test-Path -Path $key
            if (-Not $baselineExists) {
                # One of the baseline files was deleted!  Notify the user
                Write-Host "$($key) has been deleted!" -ForegroundColor DarkRed
            }
        }
    }
}
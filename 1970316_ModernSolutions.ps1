Function KillThatProcess([string] $processName) {
    #Goes and retrieves the list of processes
    $theProcesses = Get-Process $processName

    #Gets the user's input
    $userInput = (Read-Host ("There are $($theProcesses.Count) processes with the name " + $processName + ", proceed? Y/N")).ToLower()

    if($userInput -ceq "y") {
        #If input is a "Y"
        $theProcesses | kill
    } else {
        #If input is not a "Y"
        Write-Host -ForegroundColor Red "You did not confirm - no processes stopped."
    }
}

Function Bamboozle([string] $path) {
    $path = Get-Location #gets the current file path

    #generates a random number, converts it to type [char] and prints the message
    $rngLetter = ((65..90) | Get-Random)
    Write-Host -ForegroundColor Green ("""a goofy message""") 
    Write-Host ("  ↑ That's what you are telling me to print out in the instructions so there you go are you happy? Oh btw incase you wanted to know your letter was: " + [char]$rngLetter + ", there is nothing left to see here now please leave ಠ_ಠ or I will have to get my boys to escort you out (⌐■_■)")

    #checks the files within the current directory and "deletes" (not really) them.
    $files = Get-ChildItem -File -Filter '*$rngLetter*' | Remove-Item -WhatIf
}

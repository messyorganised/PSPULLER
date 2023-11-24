function WFU {
    write-host "Starting Windows Update..."  "`n"
    Invoke-Expression (Invoke-WebRequest https://neon.ly/mowfu1 -UseBasicParsing).Content
}

function DCU {
    write-host "Starting Dell Comand Update..."  "`n"
    Invoke-Expression (Invoke-WebRequest https://neon.ly/modcu1 -UseBasicParsing).Content
}

function ADBRF {
    write-host "Starting ADBRF..."  "`n"
    Invoke-Expression (Invoke-WebRequest https://raw.githubusercontent.com/messyorganised/ADBRF/main/AD%20Broker%20Folder%20Rename%20Fix.ps1 -UseBasicParsing).Content
}

function AllUpdates {
    write-host "Starting All Updates..."  "`n"
    WFU -Wait
    DCU
}

#PC Rename and Domain Join Request
Write-Host "
Welcome to PSPuller. A tool that pull scrips form my github repo. 
Please enter the following number for their corresponding services.

1= Windows Update
2= Dell command Update
3= All listed updates

Press any other keys to end the set up

"
$codelink = Read-Host
switch ($codelink) {
    '1' { WFU }
    '2' { DCU }
    '3' { AllUpdates }
    '4' { ADBRF }
    default { Write-Host "No valid options selected. Closing Puller."   "`n" }
}
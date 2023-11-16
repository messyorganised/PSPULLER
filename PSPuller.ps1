﻿
function WFU {
    write-host "
    Starting Windows Update
    "
    $ScriptFromGitHub = Invoke-WebRequest https://neon.ly/mowfu1 -UseBasicParsing
  
    Invoke-Expression $($ScriptFromGitHub.Content)
}

function DCU {
    write-host "
    Starting Dell Comand Update 
    "
    $ScriptFromGitHub = Invoke-WebRequest https://neon.ly/modcu1 -UseBasicParsing
  
    Invoke-Expression $($ScriptFromGitHub.Content)  
}

function AllUpdates {
    write-host "
    Starting All Updates...
    "
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
$PsPullerOption = $codelink

if($PsPullerOption -eq '1'){
    WFU
}

elseif($PsPullerOption -eq'2'){
    DCU
}

elseif ($PsPullerOption -eq '3') {
    AllUpdates
}

else {
    write-host "
    No valid options selected. Closing Puller.
    "
}
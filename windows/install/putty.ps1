#only 64-bit (or changing the URI)
#needs to be run with administrative privileges
echo off
#Variables
$proxyserverActive="false"
$proxyServerUrl="'http://localhost:8080'"

#Imports
Add-Type -AssemblyName System.IO.Compression.FileSystem
#Download
echo "Start download"
C:
cd C:\
if(!(Test-Path -Path C:\temp )){
    New-Item -ItemType directory -Path C:\temp
}
cd C:\temp
$command="Invoke-WebRequest"
$command="$command https://the.earth.li/~sgtatham/putty/latest/w64/putty.zip"
$command="$command -OutFile putty.zip"
if($proxyserverActive -eq "true"){
    $command="$command -Proxy $proxyServerURL"
}
powershell $command
echo "finished download"

#Extract
echo "Start extracting"
if(!(Test-Path -Path C:\temp\PuTTY )){
    New-Item -ItemType directory -Path C:\temp\PuTTY
}
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\temp\putty.zip", "C:\temp\PuTTY")
echo "finished extracting"

#Moving the directory
echo "moving folder to C:\Program Files\"
Move-Item C:\temp\PuTTY "C:\Program Files\"
echo "moving finished"

#Creating Start Menu Links
echo "Starting Creation of Startmenu Links"
cd "C:\ProgramData\Microsoft\Windows\Start Menu\Programs"
if(!(Test-Path -Path putty )){
    New-Item -ItemType directory -Path putty
}
cd putty
$WshShell = New-Object -comObject WScript.Shell
$ShortcutPutty = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\putty\PuTTY.lnk")
$ShortcutPutty.TargetPath = "C:\Program Files\PuTTY\PUTTY.EXE"
$ShortcutPutty.Save()

$ShortcutPuttyGen = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\putty\PuTTYGen.lnk")
$ShortcutPuttyGen.TargetPath = "C:\Program Files\PuTTY\PUTTYGEN.EXE"
$ShortcutPuttyGen.Save()

$ShortcutPageant = $WshShell.CreateShortcut("C:\ProgramData\Microsoft\Windows\Start Menu\Programs\putty\Pageant.lnk")
$ShortcutPageant.TargetPath = "C:\Program Files\PuTTY\PAGEANT.EXE"
$ShortcutPageant.Save()
echo "created Start Menu Links"

#Setting Path Variable
echo "setting Path Variable"
$ENV:PATH=”$ENV:PATH;C:\Program Files\PuTTY"
Set-ItemProperty -Path ‘Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment’ -Name PATH -Value $ENV:PATH
echo "finished Path Variable"

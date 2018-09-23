#only 64.bit (or changing the URI)
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
$command="$command https://download.sysinternals.com/files/SysinternalsSuite.zip"
$command="$command -OutFile sysinternal.zip"
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
[System.IO.Compression.ZipFile]::ExtractToDirectory("C:\temp\sysinternal.zip", "C:\temp\sysinternal")
echo "finished extracting"

#Moving the directory
echo "moving folder to C:\Program Files\"
Move-Item C:\temp\sysinternal "C:\Program Files\"
echo "moving finished"

#Setting Path Variable
echo "setting Path Variable"
$ENV:PATH=”$ENV:PATH;C:\Program Files\sysinternal"
Set-ItemProperty -Path ‘Registry::HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Environment’ -Name PATH -Value $ENV:PATH
echo "finished Path Variable"

echo "start cleanup"
Remove-Item C:\temp\sysinternal.zip
echo "finished cleanup"
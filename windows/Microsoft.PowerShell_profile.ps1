#Profil-ort mit echo $profile abfragen
# New-Item -Path C:\Users\lemke\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1 -ItemType SymbolicLink -Value C:\scripts\Microsoft.PowerShell_profile.ps1
New-Alias -Name np++ -Value "C:\Program Files (x86)\Notepad++\notepad++.exe"

function cdscripts { set-location "c:\scripts" }
function .. { set-location ".." }
function cdtemp { set-location "c:\temp" }
New-Alias -Name open -Value ii

#Git
New-Alias -Name g -Value git
function cgit { set-location "d:\git" }
function gst { git status }
function gco { git commit }
function gaa { git add -A }

#Aliase Unix-Befehle aus der Git installation
New-Alias -Name awk -Value "C:\Program Files\Git\usr\bin\awk.exe"
New-Alias -Name vim -Value "C:\Program Files\Git\usr\bin\vim.exe"
New-Alias -Name wc -Value "C:\Program Files\Git\usr\bin\wc.exe"
New-Alias -Name touch -Value "C:\Program Files\Git\usr\bin\touch.exe"
New-Alias -Name openssl -Value "C:\Program Files\Git\usr\bin\openssl.exe"
#New-Alias -Name grep -Value "C:\Program Files\Git\usr\bin\grep.exe"


#Docker
New-Alias -Name d -Value docker
New-Alias -Name dk -Value docker
New-Alias -Name dc -Value docker-compose
New-Alias -Name dkc -Value docker-compose
New-Alias -Name rc -Value rancher-compose
function dki { docker images }
function dkps { docker ps }
function dkpsa { docker ps -a}

#Parrot
function parrot {
    docker rm -f party-parrot > $null
    docker run --name party-parrot -it --rm jmhobbs/terminal-parrot:latest 
}
function parrotstop { docker rm -f party-parrot }

#Abstrahierte Linuxbefehle
function Export-SshKey {
<#
.SYNOPSIS
    Aequivalent zu ssh-copy-id in Powershell Stil.
.PARAMETER ComputerName
    Der Host auf welchen kopiert wird. Dies kann ein DNS-Name oder eine IP sein.
.PARAMETER UserName
    Der Benutzername des Benutzers fuer den der Key hinterlegt werden soll.
.EXAMPLE
    Export-SshKey -ComputerName 10.42.42.42 -UserName root
.EXAMPLE
    Export-SshKey -ComputerName nbmustermann -UserName max
.EXAMPLE
    Export-SshKey -ComputerName srvexample
#>
    param (
        [parameter (Mandatory=$true)]
        [string]$ComputerName,
        [string]$UserName = "root"
    )
    
    Write-Output "Exportiere SSH-Key zu $ComputerName fuer Benutzer $UserName."
    Get-Content $env:USERPROFILE\.ssh\id_rsa.pub | ssh ${UserName}@${ComputerName} "mkdir -p .ssh && touch .ssh/authorized_keys && chmod 600 .ssh/authorized_keys && cat >> .ssh/authorized_keys"
}
New-Alias -Name ssh-copy-id -Value Export-SSHKey
New-Alias -Name grep -Value Select-String
New-Alias -Name less -Value vim
#Remove-Alias -Name ls
Remove-Item alias:\ls
function ls {
    param (
        [string]$Path = "." 
    )
     
    Get-Childitem $Path | Format-Wide -AutoSize
}
New-Alias -Name la -Value Get-Childitem



function RDP {
<#
.SYNOPSIS
    Wrapper fuer mstsc
.PARAMETER HostName
    Der Host auf welchen verbunden werden soll.
.EXAMPLE
    RDP srvbeispiel
.EXAMPLE
    RDP -HostName srvbeispiel
#>
    param (
        [parameter (Mandatory=$true)]
        [string]$RDPHost
    )
    
    mstsc /v:${RDPHost} /prompt
}


#Autovervollstaendigung
Set-PSReadlineKeyHandler -Key Tab -Function Complete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Clear-Host

Invoke-Expression (&starship init powershell) # https://starship.rs
Import-Module oh-my-posh
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module posh-docker
Import-Module PSScriptTools # https://github.com/jdhitsolutions/PSScriptTools#General-Tools
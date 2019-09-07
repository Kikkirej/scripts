#!/bin/zsh
CALL_PATH=`pwd`
export ENV_DIR="/shared/git/scripts/linux/env/"
export SOFTWARE_DIR="/opt/"
cd $ENV_DIR
################################################################ ALIAS #####################################################################
alias rm='rm -i'
alias ls='ls --color=auto'
alias ll='ls -la'
alias l='ls -l'
alias ..='cd ..'
alias -- -="cd -"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias calc='bc -l'
alias mkdir='mkdir -pv' #Erstellen der Parent Ordner
alias top='atop'
alias 
#Vim
alias vi=vim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='vim'
alias changeenv='vim ${ENV_DIR}/env.sh && source ${ENV_DIR}env.sh'
#Usability
alias clipboard='xclip -sel c <' #fügt die folgende Datei ins Clipboard
alias cgit='cd /shared/git'
alias ports='netstat -tulanp'
alias d='docker'
#Autoroot
if [ $UID -ne 0 ]; then
	alias apt-get='sudo apt-get'
	alias dpkg='sudo dpkg'
	alias reboot='sudo /sbin/reboot'
	alias poweroff='sudo /sbin/poweroff'
	alias halt='sudo /sbin/halt'
	alias shutdown='sudo /sbin/shutdown'
fi
#Systeminfo
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias ports_all='ss -l'
alias ports_listen='ss -l | grep LISTEN'
#Tomato Router zuhause neustarten
alias reboottomato="ssh admin@192.168.1.1 /sbin/reboot"
alias parrot="docker run --name party-parrot -it --rm jmhobbs/terminal-parrot:latest"
alias parrotfast="curl http://parrot.live"
#Log
alias onedrivelogs='journalctl --user-unit onedrive -f'
#SSH Verbindungen
alias sshjinou='ssh -p 922 root@server.jinou.de'
alias sshlinkikkirej='ssh root@linux.kikkirej.net'
alias sshmoritzcarina='ssh root@5.45.105.24'
alias sshstrato='ssh kikkirej.net@ssh.strato.de'
alias nh='nohup'
#VPN
alias vpndo='sudo vpnc ${ENV_DIR}FHDO.conf'
alias vpnclose='sudo vpnc-disconnect'
# Startverzeichnis
cd $CALL_PATH

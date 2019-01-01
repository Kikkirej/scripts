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
#Autoroute
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
############################################################### VERSIONS ###################################################################
################################## JAVA ##############################################
################################# Java 8 #############################################
################################# Oracle #############################################
#export JDK_HOME=${SOFTWARE_DIR}dev/java/oracle/8/jdk1.8.0_191
export JDK_HOME=${SOFTWARE_DIR}dev/java/oracle/8/jdk1.8.0_192
############################## AdoptOpenJDK ##########################################
#export JDK_HOME=${SOFTWARE_DIR}dev/java/adoptopenjdk/8/jdk8u192-b12/


################################ Java 11 #############################################
################################ OpenJDK #############################################
#export JDK_HOME=${SOFTWARE_DIR}dev/java/openjdk/11/amd64/jdk-11.0.1

################################# Maven ##############################################
################################### 3 ################################################
export MAVEN_HOME=${SOFTWARE_DIR}dev/build/maven/3/3.6.0

################################ Eclipse #############################################
################################ Photon ##############################################
export ECLIPSE_EE_HOME=${SOFTWARE_DIR}dev/ide/eclipse/photon/jee64/

############################### Jetbrains ############################################
############################### Datagrip  ############################################
export DATAGRIP_HOME=${SOFTWARE_DIR}dev/ide/jetbrains/datagrip/DataGrip-2018.3
############################### Intellij  ############################################
export INTELLIJ_HOME=${SOFTWARE_DIR}dev/ide/jetbrains/intellij/idea-IU-183.4284.148
############################################################## VERSIONS END ################################################################
# Java anwenden
#if [ -z "$JDK_HOME" ] 
#then
#	exit 1
#fi
if [ "${JDK_HOME: -1}"!="/" ]
then
	export JDK_HOME=${JDK_HOME}"/"
fi
if [ -z "$_JAVA_HOME" ]
then
	export JAVA_HOME=$JDK_HOME
fi
if [ -z "$JRE_HOME" ]
then
	export JRE_HOME="${JDK_HOME}jre/"
fi
export PATH=${JDK_HOME}bin:${JRE_HOME}bin:$PATH

# Maven aktivieren
if [ "${MAVEN_HOME: -1}"!="/" ]
then
	export MAVEN_HOME=${MAVEN_HOME}"/"
fi
export PATH=${MAVEN_HOME}/bin:$PATH
#Datagrip aktivieren
if [ ${DATAGRIP_HOME: -1}!="/" ]
then
	export DATAGRIP_HOME=${DATAGRIP_HOME}"/"
fi
alias datagrip=${DATAGRIP_HOME}bin/datagrip.sh
#Intellij aktivieren
if [ "${INTELLIJ_HOME: -1}"!="/" ]
then
	export INTELLIJ_HOME=${INTELLIJ_HOME}"/"
fi
alias intellij=${INTELLIJ_HOME}bin/idea.sh
#Eclipse einbinden
if [ ${ECLIPSE_EE_HOME: -1}!="/" ]
then
	export ECLIPSE_EE_HOME=${ECLIPSE_EE_HOME}"/"
fi
if [ -z "$ECLIPSE_HOME" ]
then
	export ECLIPSE_HOME=${ECLIPSE_EE_HOME}
fi
alias eclipse=${ECLIPSE_HOME}eclipse
alias eclipseee=${ECLIPSE_EE_HOME}eclipse
# Startverzeichnis
cd $CALL_PATH

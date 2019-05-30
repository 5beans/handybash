#!/bin/bash
#------------------------------------------////
# debola ~/.bashrc file ¤ machiner
# Last Modified 21 sep 2014
# Running on Debian GNU/Linux
#------------------------------------------////

##function cd {
##    builtin cd "$@" && ls -la
##}

[ -z "$PS1" ] && return
export BROWSER='lynx'
#export EDITOR='nano'
#export NAME='USER'
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:~/bin:/sbin:/usr/sbin:/usr/local/games:/usr/games

if [[ -n $DISPLAY ]]; then
export BROWSER='~/Downloads/firefox/firefox -new-tab'
export EDITOR='leafpad'
fi
## install figlet  - naah this is silly
#echo -e "${darkgray}";figlet "eau at the chat";
case $- in
    *i*) ;;
      *) return;;
esac
alias debug="set -o nounset; set -o xtrace"
ulimit -S -c 0      # heh coredumps pffft
set -o notify
set -o noclobber
set -o physical
#set -o ignoreeof
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob
# Disable options:
shopt -u mailwarn
unset MAILCHECK        # unset that
# Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White
NC="\e[m"               # Color Reset
ALERT=${BWhite}${On_Red} # Danger Will Robertson

#echo -e "${BCyan}\
#DISPLAY on ${BRed}$DISPLAY${NC}\n"
#date

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# better less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# fancy and color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes
# beef salad

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] $(date +%H:%M) [ \[\033[01;34m\]\w\[\033[00m\] ]:\$ '
#export PS1="\$"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
export HISTIGNORE="&:bg:fg:ll:h"
export HISTTIMEFORMAT="$(echo -e ${BCyan})[%d/%m %H:%M:%S]$(echo -e ${NC}) "
export HISTCONTROL=ignoredups
#export HOSTFILE=$HOME/.hosts    # home hosts naah
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls -la --color=auto'
    alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

#-------------------------------------------------------------
# More is 'less' and less goodness
#-------------------------------------------------------------
alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

# man page fanciness
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#------------------------------------------////
# Handy One-Liners:
#------------------------------------------////
function weather() { sh ~/.config/scripts/weather.sh ZIPCODE; }
function historyawk(){ history|awk '{a[$2]++}END{for(i in a){printf"%5d\t%s\n",a[i],i}}'|sort -nr|head; }
function mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
function lsmac() { sudo ifconfig -a | awk '/HWaddr/ {print $5}' ; }
function my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,bsdtime,command ; }
function pp() { my_ps f | awk '!/awk/ && $0~var' var=${1:-".*"} ; }
function wordnet() { curl dict://dict.org/d:${1}:wn; }
function sizes() { du -hcs */ | sed '$d';}
function randpw() { </dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c12; echo ""; }
function vimhtml() { [[ -f "$1" ]] || return 1; vim +'syn on | run! syntax/2html.vim | wq | q' "$1";}
function clock () { while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done }
#------------------------------------------////
# Handy Utility:
#------------------------------------------////
note ()
{
        #if file doesn't exist, create it
        [ -f $HOME/.notes ] || touch $HOME/.notes

        #no arguments, print file
        if [ $# = 0 ]
        then
                cat $HOME/.notes
        #clear file
        elif [ $1 = -c ]
        then
                > $HOME/.notes
        #add all arguments to file
        else
                echo "$@" >> $HOME/.notes
        fi
}
function bofh() { telnet towel.blinkenlights.nl 666 2>/dev/null |tail -2 ; }

function fix() {
   if [ -d $1 ]; then
  sudo find $1 -type d -exec chmod 755 {} \;
  sudo find $1 -type f -exec chmod 644 {} \;
   else
   echo "$1 is not a directory."
   fi
}

function mkcdr() {
    mkdir -p -v $1
    cd $1
}
function allips()
{
sudo ifconfig | awk '/inet / {sub(/addr:/, "", $2); print $2}'
}
function cyanide() { display "$(wget -q http://explosm.net/comics/random/ -O - | grep -Po 'http://www.explosm.net/db/files/Comics/*/[^"]+(png|jpg|jpeg)')"; }

function grepcolor()
{
cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"
}

function natdebt()
{
watch -n 10 "wget -q http://www.brillig.com/debt_clock -O - | grep debtiv.gif | sed -e 's/.*ALT=\"//' -e 's/\".*//' -e 's/ //g'"
}

function aptitude-remove-dep() { sudo aptitude markauto $(apt-cache showsrc "$1" | grep Build-Depends | perl -p -e 's/(?:[\[(].+?[\])]|Build-Depends:|,|\|)//g'); }

function arabic2roman() {

  echo $1 | sed -e 's/1...$/M&/;s/2...$/MM&/;s/3...$/MMM&/;s/4...$/MMMM&/
s/6..$/DC&/;s/7..$/DCC&/;s/8..$/DCCC&/;s/9..$/CM&/
s/1..$/C&/;s/2..$/CC&/;s/3..$/CCC&/;s/4..$/CD&/;s/5..$/D&/
s/6.$/LX&/;s/7.$/LXX&/;s/8.$/LXXX&/;s/9.$/XC&/
s/1.$/X&/;s/2.$/XX&/;s/3.$/XXX&/;s/4.$/XL&/;s/5.$/L&/
s/1$/I/;s/2$/II/;s/3$/III/;s/4$/IV/;s/5$/V/
s/6$/VI/;s/7$/VII/;s/8$/VIII/;s/9$/IX/
s/[0-9]//g'

}

function calc() {
echo "scale=4; $1" | bc
}

function cel2fah() {

  if [[ $1 ]]; then
	echo "scale=2; $1 * 1.8  + 32" | bc
  fi

}

function fah2cel() {

  if [[ $1 ]]; then
	echo "scale=2 ; ( $1 - 32  ) / 1.8" | bc
  fi

}

function stopwatch() {
   # copyright 2007 - 2010 Christopher Bratusek
   BEGIN=$(date +%s)
   while true; do
    NOW=$(date +%s)
    DIFF=$(($NOW - $BEGIN))
    MINS=$(($DIFF / 60))
    SECS=$(($DIFF % 60))
    echo -ne "Time elapsed: $MINS:`printf %02d $SECS`\r"
   done
}
# lowercase all files in the current directory
function lcfiles() {
	print -n 'Really lowercase all files? (y/n) '
	if read -q ; then
		for i in * ; do
			mv $i $i:l
	done
	fi
}
# Convert the first letter into uppercase letters
function ucfirst() {
      if [ -n "$1" ]; then
          perl -e 'print ucfirst('$1')'
      else
          cat - | perl -ne 'print ucfirst($_)'
      fi
}

function cd() {
   if [ -n "$1" ]; then
    builtin cd "$@" && ls -l
   else
    builtin cd ~ && ls -l
  fi
}

function encrypt () {
   gpg -ac --no-options "$1"
}
function decrypt ()
{
   gpg --no-options "$1"
}
function encfile () {
   zenity --title="zcrypt: Select a file to encrypt" --file-selection > zcrypt
   encryptthisfile=`cat zcrypt`;rm zcrypt
   # Use ascii armor
   #  --no-options (use for NO gui)
   gpg -acq --yes ${encryptthisfile}
   zenity --info --title "File Encrypted" --text "$encryptthisfile has been
encrypted"
}
function decfile () {
   zenity --title="zcrypt: Select a file to decrypt" --file-selection > zcrypt
   decryptthisfile=`cat zcrypt`;rm zcrypt
   # NOTE: This will OVERWRITE existing files with the same name !!!
   gpg --yes -q ${decryptthisfile}
   zenity --info --title "File Decrypted" --text "$encryptthisfile has been
decrypted"
}

# tar that shit up
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }

# zip that shit up
function makezip() { zip -r "${1%%/}.zip" "$1" ; }

# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}

#extract them all
function extract() {
   if [ -f "$1" ] ; then
   case "$1" in
   *.tar.bz2) tar xjf "$1" ;;
   *.tar.gz) tar xzf "$1" ;;
   *.tar.Z) tar xzf "$1" ;;
   *.bz2) bunzip2 "$1" ;;
   *.rar) unrar x "$1" ;;
   *.gz) gunzip "$1" ;;
   *.jar) unzip "$1" ;;
   *.tar) tar xf "$1" ;;
   *.tbz2) tar xjf "$1" ;;
   *.tgz) tar xzf "$1" ;;
   *.zip) unzip "$1" ;;
   *.Z) uncompress "$1" ;;
   *) echo "'$1' cannot be extracted." ;;
   esac
   else
   echo "'$1' is not a file."
fi
}
   #------------------------------------------////
   # Handy Network:
   #------------------------------------------////
function myip () {
    lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | grep "Current IP Address" | cut -d":" -f2 | cut -d" " -f2
}
function portscan() {
   $HOST=127.0.0.1;for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}
function hostis() {
    echo -e "\nYou are logged on ${RED}$HOST"
    echo -e "\nAdditionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date :$NC " ; date
    echo -e "\n${RED}Machine stats :$NC " ; uptime
    echo -e "\n${RED}Memory stats :$NC " ; free
    my_ip 2>&- ;
    echo -e "\n${RED}Local IP Address :$NC" ; echo ${MY_IP:-"Not connected"}
    echo -e "\n${RED}ISP Address :$NC" ; echo ${MY_ISP:-"Not connected"}
    echo -e "\n${RED}Open connections :$NC "; netstat -pan --inet;
    echo
}
   #------------------------------------------////
   # Handy Info:
   #------------------------------------------////

function ii2() {
    echo -e "\n${RED}You are logged onto:$NC " ; hostname
    echo -e "\n${RED}Additionnal information:$NC " ; uname -a
    echo -e "\n${RED}Users logged on:$NC " ; w -h
    echo -e "\n${RED}Current date:$NC " ; date
    echo -e "\n${RED}Machine stat:$NC " ; uptime
    echo -e "\n${RED}Disk space:$NC " ; df -h
    echo -e "\n${RED}Memory stats (in MB):$NC " ;
    if [ "$OS" = "Linux" ]; then
        free -m
    elif [ "$OS" = "Darwin" ]; then
        vm_stat
    fi
    echo -e "\n${RED}IPs:$NC " ; ips
}
function my_ip() # ethernet ip updated eth0 no longer.
{
    MY_IP=$(/sbin/ifconfig enp1s0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

function ii()   # Get current host related info.
{
    echo -e "\nYou are logged on ${BRed}$HOST"
    echo -e "\n${BRed}Additionnal information:$NC " ; uname -a
    echo -e "\n${BRed}Users logged on:$NC " ; w -hs |
             cut -d " " -f1 | sort | uniq
    echo -e "\n${BRed}Current date :$NC " ; date
    echo -e "\n${BRed}Machine stats :$NC " ; uptime
    echo -e "\n${BRed}Memory stats :$NC " ; free
    echo -e "\n${BRed}Diskspace :$NC " ; mydf / $HOME
    echo -e "\n${BRed}Local IP Address :$NC" ; my_ip
    echo -e "\n${BRed}Open connections :$NC "; netstat -pan --inet;
    echo
}


# usage: pronounce "word1" "word2" "word3" "..."
function pronounce() {

            $(wget -qO- "http://dictionary.reference.com/browse/$@" | grep 'soundUrl' | head -n 1 | sed 's|.*soundUrl=\([^&]*\)&.*|\1|' | sed 's/%3A/:/g;s/%2F/\//g') | mpg123 -;
}
function showfile() {
   width=72
   for input
   do
  lines="$(wc -l < $input | sed 's/ //g')"
  chars="$(wc -c < $input | sed 's/ //g')"
  owner="$(ls -ld $input | awk '{print $3}')"
  echo "-----------------------------------------------------------------"
  echo "File $input ($lines lines, $chars characters, owned by $owner):"
  echo "-----------------------------------------------------------------"
  while read line
    do
      if [ ${#line} -gt $width ] ; then
        echo "$line" | fmt | sed -e '1s/^/  /' -e '2,$s/^/+ /'
      else
        echo "  $line"
      fi
    done < $input
  echo "-----------------------------------------------------------------"
   done | more
}
function dirsize() {
   du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
   egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
   egrep '^ *[0-9.]*M' /tmp/list
   egrep '^ *[0-9.]*G' /tmp/list
   rm /tmp/list
}
function newest () {
   find . -mtime -1 -print
}
function upinfo () {
   echo -ne "${green}$HOSTNAME ${red}uptime is ${cyan} \t ";uptime | awk /'up/ {print $3,$4,$5,$6,$7,$8,$9,$10}'
}
function facts () {
   wget randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed -e "s;^.*<i>\(.*\)</i>.*$;\1;g"
}

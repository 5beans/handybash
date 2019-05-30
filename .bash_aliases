##aliases
##debola - machiner - updated 7 december 2013
# edited for distribution
#------------------------------------------////
# Net:
#------------------------------------------////
##alias sinkit='rsync -av --rsh="ssh -pXXXXX" --delete .config/ USER@SERVER:~/debola/'
alias listips='nmap -sP 192.168.1.0/24'
alias clients='sudo nmap -sn 192.168.1.0/24'
alias ip='curl ifconfig.me'
alias ports='sudo netstat -tulanp'
alias ping='ping -c 4'
alias ns='sudo netstat -alnp --protocol=inet'
alias router='/usr/lib/firefox-esr/firefox-esr https://192.168.1.1 &'
##alias mac='ifconfig | grep HWaddr'
alias up='sudo ifup enp1s0'
#------------------------------------------////
# System:
#------------------------------------------////
alias cdv='cd /var/www/html && ls -la'
alias mysql='mysql -u root -p'
#alias tail='sudo tail /var/log/apache2/error.log'
alias systemctl='sudo systemctl restart'
alias findbig='find . -type f -exec ls -s {} \; | sort -n -r | head -5'
alias cleancache='sudo /sbin/sysctl vm.drop_caches=3'
alias clf='curl "https://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext"'
alias 10big='du -s * | sort -n | tail'
alias su='sudo -i'
alias xterm='xterm -fa monaco -fs 10 -bg black -fg orange1 -g 95x25 -sb -rightbar'
alias dirf='ls -la | grep "^d" && ls -la | grep "^-" && ls -la | grep "^l"'
#------------------------------------------////
# Package Management:
#------------------------------------------////
alias sources='sudo nano /etc/apt/sources.list'
alias orphans='sudo deborphan'
alias show='aptitude show'
alias list='dpkg -L'
alias apps='sudo synaptic'
alias search='aptitude search'
alias update='sudo aptitude update'
alias foster='sudo debfoster'
alias upgrade='sudo aptitude full-upgrade'
alias cpf='sudo aptitude clean && sudo aptitude purge ~c && sudo aptitude -f install'
alias remove='sudo aptitude purge'
alias install='sudo aptitude --without-recommends install'
alias devs="aptitude -F '%p' search '~i -dev$'"
alias devsizes="aptitude -F '%I %p' search '~i -dev$'"
alias hold='sudo aptitude hold'
alias unhold='sudo aptitude unhold'
#------------------------------------------////
# SSH:
#------------------------------------------////
alias ch='sshfs -p PORT  USER@192.168.1.105:/home/bronk DIRECTORY/'
##alias oldroot='sshfs -p PORT USER@192.168.1.105:/mnt/DIRECTORY oldroot'
##alias oldhome='sshfs -p PORT USER@192.168.1.105:/mnt/DIRECTORY oldhome'
##alias ipad='ssh -l root 192.168.1.114'
##alias uch='fusermount -u DIRECTORY'
##alias hb1='ssh -p PORT -l USER SERVER'
##alias fb='ssh -l USER -p PORT 192.168.1.109'
##alias cb='ssh -l USER -p PORT 192.168.1.105'
##alias cb1='ssh -p PORT USER@SERVER'
#------------------------------------------////
# Desktop:
#------------------------------------------////
alias makepwd='head -c 12 /dev/urandom | openssl enc -base64'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ls='ls -abp --color=auto'
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll='ls -lv --group-directories-first'
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias s='echo $(date) : $(whoami)@$(hostname) : $(ps axu | grep "USER" | wc -l) ps : $(pwd)'
alias timer='~/bin/timer.sh'
alias rc='nano ~/.config/openbox/rc.xml'
alias ll='ls -l --group-directories-first'
alias l='ls -la --color=auto'
alias word='/usr/bin/lowriter'
alias auto='nano ~/.config/openbox/autostart.sh'
alias menu='nano ~/.config/openbox/menu.xml'
alias nap='sudo /usr/sbin/pm-suspend'
alias again='sudo shutdown -r now'
alias off='sudo shutdown -h now'
#alias terms='sudo cryptsetup luksOpen /dev/sdb1 terms && mount /mnt/terms'
#alias closeterms='sudo umount /mnt/terms && sudo cryptsetup luksClose terms'
alias localg='sudo /opt/sublime_text/sublime_text  /var/www/html/local.html &'

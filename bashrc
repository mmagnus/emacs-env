#
#   Marcin Magnus
#   $Id: bashrc-OK 26 2009-07-08 16:16:47Z mx5rx9 $
#
#   EON
#
#alias foraddDuration='for.sh toolboXaddDuration.py yes'
#
alias fortXtoEonFLV='for.sh tXtoEON.sh flv'
alias fortXtoEonFLVCROP='for.sh tXtoEON.sh flvcrop'
alias fortXtoEonWMV='for.sh tXtoEON.sh wmv'
alias fortXtoEonAVI='for.sh tXtoEON.sh avi '
#
alias mm_editmyautostart='sudo emacs /etc/init.d/myautostart.sh'
#alias editapt='sudo emacs -nw /etc/apt/sources.list'
alias mm_editapt='sudo gedit /etc/apt/sources.list'
#
#    NOTES
#    help ~MM~ info, help mode of my consle with my personal information ;)
#
alias help_lsof="echo 'lsof /dev/sdd1'"
alias help_bash_if="for i in ls *.aif; do echo $i; sox $i ${i//.aif/.wav}; done"
alias help_iconv="echo 'iconv -f latin2 -t utf-8 That.txt  -o output'"
alias help_eon="echo 'mencoder -oac mp3lame/copy -ovc xvid -vf scale=400:240 -xvidencopts bitrate=300 -sub $subtitles -o out.avi in.avi'"
alias help_redirection="find / -name commands.py 2>/dev/null"
alias help_make_iso="dd if=/dev/cdrom of=~/x
.iso"
#
#     pwsafe
#
alias mm_gorillapwsafe='password-gorilla /media/truecrypt1/moin-mobilix-pwsafe/pwsafe.dat'
#
#
alias pdfxcviewer='wine /home/magnus/bin/pdf-viewer/PDFXCview.exe'
#
alias mm_lingXonline='screen -S lingX -md python /home/magnus/django/lingXproject/manage.py runserver 0.0.0.0:9000'
#
#  to nie jest potrzebne, jezeli uruchamiasz apliakacje przez manage.py runserver !!!
#
#PYTHONPATH=/home/magnus/django/testproject/testapp
#OYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/testapp/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/testapp/scripts/
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace/myutilspy/
PYTHONPATH=$PYTHONPATH:/home/magnus/django/metaserver/MetaPredictor/libs
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace/lingX
PYTHONPATH=$PYTHONPATH:/home/magnus/django/metaserver/MetaPredictor/scripts/
PYTHONPATH=$PYTHONPATH:/home/magnus/django/metaserver/MetaPredictor/scripts/mp_modules/

PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.6/dist-packages/
PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.6/dist-packages/simtk
PYTHONPATH=$PYTHONPATH:/home/magnus/rna/NAST/PyOpenMM-3.0.0/
PYTHONPATH=$PYTHONPATH:/usr/lib/python2.4/site-packages/
#
#  to tez jest chyba nie potrzebne
#
PYTHONPATH=$PYTHONPATH:/home/magnus/django/
PYTHONPATH=$PYTHONPATH:/home/magnus/django/lingXproject
PYTHONPATH=$PYTHONPATH:/home/magnus/django/lingXproject/lingXapp/
PYTHONPATH=$PYTHONPATH:/home/magnus/Dropbox/workspace/hamsterplan/hamsterprj
PYTHONPATH=$PYTHONPATH:/home/magnus/Dropbox/workspace/hamsterplan/
#
#  to jest potrzebne :)
#
#DJANGO_SETTINGS_MODULE='lingXproject.settings'
DJANGO_SETTINGS_MODULE='hamsterprj.settings'
export DJANGO_SETTINGS_MODULE
#
EDITOR="/usr/bin/emacs23"
export EDITOR

export set CDPATH=.:~:/home/magnus/stuff/:/home/magnus/stuff/downloads/completed/:~/stuff/video:/home/magnus/stuff/downloads/tmps 
#
#    powersaved energy
#
alias mm_superpower='sudo powersave -f'
alias mm_savepower='sudo powersave -l'
alias mm_blackscreen='/etc/acpi/screenblank.sh'
#
#    run
# 
alias rungtk_convert_only="echo 'input: funnybox.GTKbuilder.glade\n'; gtk-builder-convert funnybox.GTKbuilder.glade funnybox.xml"
alias rungtk="gtk-builder-convert funnybox.glade funnybox.xml && python "
#
#   espeak
#
alias ee="espeak "
alias xe="xclip -o -selection c | espeak"
#
#    ls
#
alias lsm='ls -m'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsal='ls -al'
alias lsla='ls -al'
#
#   mplayer
#
alias mplayernovido="mplayer -novideo "
#
#    
#goto section
#settu
#
#alias cdx='cd  xlclip
alias settu='alias gotu="cd `pwd`"' # set gotu variable
alias gobet="cd /home/magnus/stuff/downloads/completed/rs/BetterSexCollection"
alias gotakeoutix="cd /media/ATV/testpdf/media/ATV/takeoutix"
alias gotmps='cd /home/magnus/stuff/downloads/tmps'
alias gohp='cd /media/HPDISK/	'
alias gomp='cd /home/magnus/django/metaserver/MetaPredictor'
alias goprogramfiles='cd "/home/magnus/.wine/drive_c/Program Files" '
alias gogetwav='cd /home/magnus/workspace/lingX/old-ones/getWav/'
alias gors='cd /home/magnus/stuff/downloads/completed/rs/'
alias gothat='cd /home/magnus/stuff/downloads/completed/rs/That70s06'
alias goX='cd /home/magnus/stuff/downloads/completed/X/'
alias dc='cd /home/magnus/stuff/downloads/completed/'
alias gofunnybox='cd /home/magnus/workspace/funnybox'
alias gomt='cd /home/magnus/stuff/workspace/masterthesis/master2010/'
#
alias dff='df -x tmpfs'
#
#    p2p
#
alias rapidshare="xclip -o > temp.ff ; echo '-----';cat temp.ff; cp -v temp.ff rapidshare.filelist.txt;echo;echo '-----';  rsdownloader temp.ff ; echo '#
 delete temprary file: temp.ff ?'; rm temp.ff"
#
#w
#
alias cleanubuntu='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove'
alias cleanrar='yes | rm -r *.r* *.sfv *.nfo Sample/'
#
#   mlnet
#
alias mlnetscreen='screen -S mlnetScreen -md mlnet &'
alias mlnetrestart='rm /home/magnus/stuff/downloads/.mldonkey/downloads.ini.tmp &&  rm /home/magnus/stuff/downloads/.mldonkey/users.ini.tmp && rm /home/magnus/stuff/downloads/.mldonkey/files.ini.tmp'
#
#   eon
#
alias umounteXtreme='sudo umount /media/eXtremeStuff'
#
alias mount_force='sudo mount -t ntfs-3g /dev/sdb1 /media/hp -o force'
alias mount_force_sdd='sudo mount -t ntfs-3g /dev/sdd1 /media/hp -o force'
alias mount_force2='sudo mkdir /media/hp || sudo mount -t ntfs-3g /dev/sdb2 /media/hp -o force'
alias mount_collins='sudo mount /home/magnus/apps/collins/dictionary.collins.iso /media/collins -t iso9660 -o loop'
#
alias connect='ssh -X -v 192.168.0.10'
alias mm_tomeksStation='ssh -X -v 150.254.122.228'
#   network
#
alias o2.pl=' ping o2.pl'
alias if0='ifconfig eth0'
alias if1='ifconfig eth1'
alias iff='ifconfig'
alias ifup0='sudo ifup eth0'
alias ifup1='sudo ifup eth1'
alias ifupath='sudo ifconfig ath0 up'
alias start='sudo macchanger -m 00:16:D4:DC:C3:1F eth0 && sudo ifdown eth0 && sudo ifup eth0 && sudo dhclient eth0 && firefox '
alias inter='sudo emacs /etc/network/interfaces'
alias get_ip='sudo dhclient eth0'
alias ifset='sudo ifconfig eth0 192.168.0.1'
#
#   MAC
#
alias change_mac_home='sudo macchanger -m 00:A1:B0:00:63:13 eth0 && sudo ifdown eth0 && sudo ifup eth0'
alias change_mac_milenka='sudo macchanger -m 00:17:08:46:3C:28 eth0 && sudo ifdown eth0 && sudo ifup eth0'
alias jerzy_change_mac_jerzy='sudo macchanger -m 00:16:D4:DC:C3:1F eth0 && sudo ifdown eth0 && sudo ifup eth0 && sudo dhclient eth0'
#
#    movie
#
alias movieconsole='sudo mplayer -ao oss -vo svga '
alias beepX='play /home/magnus/.mozilla/firefox/ssfbppfu.default/extensions/{D4DD63FA-01E4-46a7-B6B1-EDAB7D6AD389}/chrome/content/downbar_finished.wav'

#
#   update/install/synaptic
#
alias update="sudo apt-get update "
alias upgrade="sudo apt-get dist-upgrade "
alias install="sudo apt-get install "
alias search="apt-cache search "
alias synaptic="gksu synaptic "
alias remove='sudo apt-get remove'
alias package_search='apt-cache search '
#
#
#alias su=’sudo -i’
#sudo -i creates a root terminal
#
#     moin
#
#alias moin='screen -S moin -md /home/magnus/stuff/moinmoin/moin-desktop/moin.py &'
#alias moin='screen -S moin -md python /media/TOSHIBA/moinmoin-mobilix-1.8/moin-desktop/wikiserver.py &'
#alias moin='screen -S moin -md python /media/HPDISK/moinmoin-mobilix-1.8/moin-desktop/wikiserver.py &'
#alias moin='screen -S moin -md python /media/ATV/moin-desktop/wikiserver.py &'
alias moin='screen -S moin -md moinfindandrun.sh'
#alias moin="python 
#
#     emacs 
#
SVN_EDITOR='emacs -rv -nw --color=never'
export SVN_EDITOR
export PYTHONPATH
#
alias restart='source ~/.bashrc'
#
#
#
alias df='df -h'
#
#   sms 
#   apt-get install sms-pl
#
alias sms_legacz='sms -g plus -n 609246083 -m - -t "marcin"'
alias sms_mama='sms -g plus -n 661438972 -m - -t "marcin"'
alias sms_marcin='sms -g plus -n 601714835 -m - -t "marcin"'
#
#       SVN
#
alias svnls='svn ls file:///home/magnus/stuff/svn/'
#
#
#
alias rm="rm -i"
#alias rm="rmw -iv"
#alias rm_clean_waste=" -v ~/.Waste"
#
#
alias genesilico='ssh magnus@ssh.genesilico.pl'
#
alias rcemacs='emacs ~/.bashrc && restart && echo "restart..."'
#-rv
alias rcgedit='gedit  ~/.bashrc && restart && echo "restart..."'
#
#    radio
#
alias mm_afera="gmplayer http://gdansk.radio.pionier.net.pl:8000/pl/afera4.ogg"
alias mm_reagge-ulicznik='mplayer http://www.ulicznik.net/ulicznik10/sluchaj.m3u'
alias mm_streamripperreagge='streamripper http://www.ulicznik.net/ulicznik10/sluchaj.m3u'

# NEW 2010-11
alias mm_ulicznikpolskipunk='mplayer http://94.23.200.43:7200/listen.pls'
alias mm_ulicznikreggae='mplayer http://94.23.200.43:7300/listen.pls'
alias mm_ulicznikgrunge='mplayer http://94.23.200.43:7400/listen.pls'
alias mm_ulicznikska='mplayer http://94.23.200.43:7100/listen.pls'


alias mm_streamripperstreetpunk='streamripper http://www.ulicznik.net/kanal-7/sluchaj.m3u'
alias mm_tokfm='mplayer http://www.radio.pionier.net.pl/stream.pls?radio=radiotok'
alias mm_ugandaradio='mplayer http://www.connectuganda.com/lib/nowplaying/playlists/connectuganda-low.m3u'
alias mm_bbc='cvlc http://www.bbc.co.uk//worldservice/meta/tx/nb/live_news_au_nb.asx'
#alias mm_bbc="smplayer -add-to-playlist http://www.bbc.co.uk/worldservice/meta/tx/nb/live/eneuk.pls"
#
##########
alias predict='./predict.py VW46S'
alias datastudio='/home/magnus/stuff/apps/datastudio/datastudio.sh'
#
#convert -border 5 -bordercolor white img_6888.jpg a.png
#
export SPDBV_USRSTUFF='/home/magnus/SPDBV/usrstuff'
export SPDBV_DOWNLOAD='/home/magnus/SPDBV/usrstuff'
export SPDBV_TEMP='/home/magnus/SPDBV/usrstuff'
###########
#
alias mirror'=ssh  mirror@150.254.176.193'
#apache2
alias ar='sudo /etc/init.d/apache2 restart'
alias ad='cd /etc/apache2/'
#
# metapredictior
#
alias mps='cd /home/magnus/django/metaserver/MetaPredictor/scripts'
alias mpt='cd /home/magnus/django/metaserver/MetaPredictor/tools'
alias mpd='cd /home/magnus/django/metaserver/MetaPredictor/'
alias mprun='python /home/magnus/django/metaserver/manage.py runserver 0.0.0.0:8000'
alias mppredit="python /home/magnus/django/metaserver/MetaPredictor/scripts/predict.py -a"
alias mpmeta="python metaprediction_wages.py loc 111111111111111 0.7 0.5 0.1"
alias mpmeta10="python metaprediction_wages.py loc 10 0.7 0.5 0.1"
alias mpmetaf="python metaprediction_wages.py loc 111111111111111 0.7 0.5 0.1 0.3 0.3 0.3"

alias jobd='~/django/metaserver/MetaPredictor/resultfiles/VW46S'
#     
#      wine
#
alias et="wine /home/magnus/.wine/drive_c/Program\ Files/Techland/English\ Translator\ XT/EnglishTranslator.exe"
alias djview="wine /home/magnus/bin/software.WinDjView-0.5.exe "
alias pdfviewerpro='wine "/home/magnus/.wine/dosdevices/c:/Program Files/Tracker Software/PDF-XChange Viewer/pdf-viewer/PDFXCview.exe" '
#
alias screenshot-installed='dpkg --get-selections > installed-software-kadu-skype-mocp-amule-thunderbird-firefox-addon'
alias malibu='gedit  ~/stuff/many-diff-files/malibu.txt'
alias sls='screen -ls'

#
#
#
export HMMTOP_ARCH='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export HMMTOP_PSV='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export PSORT_ROOT='/home/magnus/django/metaserver/MetaPredictor/tools/PSORTb3/05.bio-tools-psort-all-3.0.3'
export PSORT_HMMTOP='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export PSORT_PFTOOLS='/usr/share/pftools23/bin/'
export BLASTDIR='/usr/bin/'

#

#

PATH=$PATH:/home/magnus/django/metaserver/MetaPredictor/tools/TMHMM2.0c/bin
PATH=$PATH:/home/magnus/bin
PATH=$PATH:/home/magnus/workspace
PATH=$PATH:/home/magnus/workspace/myutil
PATH=$PATH:/home/magnus/bin/pythoniczki
PATH=$PATH:/home/magnus/workspace/pythonlib
PATH=$PATH:/home/magnus/workspace/lingX/
PATH=$PATH:/home/magnus/rna/simRNA/SimRNA-current/
PATH=$PATH:/home/magnus/Dropbox/workspace/
#R
export RHOME='/usr/local/lib/R'




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#
#    BY >
#
alias rsyncbin="rsync -av ~/bin/ sv:~/bin/"
alias rsyncworkspace="rsync -av workspace/ sv:~/workspace/" 
alias rsyncworkspace="rsync -av ~/workspace/ sv:~/workspace/" 

alias rsyncEON='rsync -av --delete /media/EON/ /home/magnus/stuff/backups-EON/'
alias rsyncmp3='rsync -vur --delete /home/magnus/stuff/music/downloads/mp3/ /media/EON/music/mp3/'

alias gm="gmplayer "
alias lingXonline="screen -mdS lingXonline /home/magnus/bin/start_lingXonline.sh"
#
#external monitor
alias mm_exmonitor_off="xrandr --output VGA-0 --off"
#alias exmonitor_on="xrandr --output VGA-0 --mode 1280x1024"
#alias mm_exmonitor_on="xrandr --output VGA-0 --mode 1280x1024 --right-of LVDS"
alias mm_exmonitor_on="xrandr --output VGA-0 --mode 1440x900 --right-of LVDS"

#17calowy taki ma --mode 1280x1024 --right-of LVDS
alias mm_asus_on="xrandr --output VGA-0 --mode 1440x900 --right-of LVDS"
alias mm_addborder="echo 'convert -border 5x5 -bordercolor "#000" p.copy.png p.c.png'"

alias mm_limitmencoder="cpulimit  -e mencoder -l 50 -v"
alias mm_limitmencoder30="cpulimit  -e mencoder -l 30 -v"
#
alias mm_limitfirefox="cpulimit  -e firefox-bin -l 50 -v"
alias mm_mytrain="kipina /home/magnus/.kipina/mytraining.xml &"
alias gstart="gnome-session"
alias mm_backup_mindmapp="fwbackups-run -v 'mindmaping'"
alias mm_screenshot="import -frame /home/magnus/Desktop/temp.png"

alias mm_mod1='perl proces.pl set02.txt > set2.neurons.cvs && head set2.neurons.cvs'
alias sqlfb='sqlitebrowser funnybox.db'
alias mm_thinkingrock="/home/magnus/apps/archives-pkgs/tr-2.2.1-with-jre/bin/tr.sh"
alias mm_fbcopy="cp -r -v /home/magnus/stuff/workspace/funnybox/ /media/disk/"

#install#the best way!!! and genome browser works after that
alias mm_install_java="apt-get install default-jre"


### ntfs-3g
alias mm_ntfs_info="echo 'sudo ntfs-3g /dev/sda1 /media/stick -o force'"
alias mm_ntfs_mount="sudo ntfs-3g /dev/sda1 /media/stick -o force"


alias mm_tXcopyflash="cp -uv /tmp/Flash* /media/EON/youtube/" 
alias mm_flashopen="smplayer /tmp/Flash*"
### define where to save
alias mm_flashconvert="cd /tmp && tXtoEON.sh Flas* avi && mv -v /tmp/Flas*avi /home/magnus/temp_flv"

alias pdfl="pdflatex -interaction nonstopmode "

alias gobiologiasytemow="cd /home/magnus/stuff/studies/biologiasystemow_V_2009/project"
alias gomemeingalaxy="cd /home/magnus/stuff/studies/biologiasystemow_V_2009/project/galaxy/galaxy_dist/tools/meme"
alias youtube2mp3_xclip="xclip -o > temp ; youtube2mp3.py temp"


alias goweightless302="cd /home/magnus/workspace/weightless_r_package/weightless302"
alias goweightless="cd /home/magnus/workspace/weightless_r_package/"

alias wwcompile="gcc -c fromphylip.c && gcc -c weightless.c && gcc  weightless.o fromphylip.o -lm -o weightless && echo 'done'"

alias wwbuildinstall="R CMD build weightless && sudo R CMD INSTALL weightless_0.1.tar.gz"
alias wwbuild="R CMD build weightless"
alias wwinstall="sudo R CMD INSTALL weightless_0.1.tar.gz"

alias gomaster="cd /home/magnus/workspace/masterthesis/master2010"

alias smplayeradd="smplayer -add-to-playlist "

#alias rapidshare="xclip -o > temp ; echo '-----';cat temp.ff; cp -v temp.ff #rapidshare.filelist.txt;echo;echo '-----';  rsdownloader temp.ff ; echo '#
# delete temprary file: temp.ff ?'; rm temp.ff"
alias ff38="/home/magnus/apps/firefox-3.6.8/firefox/firefox"
alias gita="git add "
alias gitc="git commit -m "
alias gits="git status"
alias mm_domaster="pdftk A=intro.pdf B=master02.pdf cat A B3-end output marcin-magnus-mgr.pdf"
alias mm_tunel8888_to_magnus='ssh  -L 8888:localhost:8888 magnus'

alias mm_sshmagnus="ssh -X vpn-magnus.genesilico.pl"

alias gomp_modules="cd /home/magnus/django/metaserver/MetaPredictor/scripts/mp_modules/"
alias mm_sernikfullscreen="rdesktop -a 16 -k pl -f sernik"
alias mm_sernik="rdesktop -a 16 -k pl -g 1200x800 sernik &"
alias mm_freerapid="/home/magnus/apps/FreeRapid-0.83u1/frd.sh"
alias goga="cd /home/magnus/workspace/python-ga/python-genetics/"
alias mm_rename_ulicznikzadyma="rename 's/ULICZNIK.net-ZADYMA.//' *"
alias goscripts=" cd /home/magnus/django/metaserver/MetaPredictor/scripts"
alias godscripts="cd /home/magnus/django/metaserver-dataset/scripts"

alias killstreamripper="pkill streamripper"
alias mm_start_bioinfodict="python /home/magnus/workspace/bioinfo-dict/moin-1.9.3/wikiserver.py"
#alias rm="rmlocalsharetrash.shmv /home/magnus/.loc/home/magnus/apps/xmind/XMind_Linux
#	al/share/Trash/files/
alias xmind="/home/magnus/apps/xmind/XMind_Linux/xmind"
alias gitrmcahce="git rm -r --cached cache/"
alias foxit="wine /home/magnus/apps/FoxitReader431_enu_Setup.exe"
alias hm="hamster-cli start "
alias mpdo_sth_for_all_jobs="python do_sth_for_all_jobs.py 1 1 1 1 1 1 1 1"

alias mm_lingXonlinestart="python manage.py runserver 0.0.0.0:8989"
alias mm_magnus="ssh -X vpn-magnus.genesilico.pl"
alias gohamsterapp="cd /home/magnus/Dropbox/workspace/hamsterplan/"
alias mm_akademik="ssh 85092616739@www.sds.uw.edu.pl"
alias hmlist='hamster-cli list'

#
#   Marcin Magnus
#   $Id: bashrc-OK 26 2009-07-08 16:16:47Z mx5rx9 $
#
#   EON
#
#alias foraddDuration='for.sh toolboXaddDuration.py yes'
#
alias fortXtoEonFLV='for.sh tXtoEON.sh flv'
alias fortXtoEonFLVCROP='for.sh tXtoEON.sh flvcrop'
alias fortXtoEonWMV='for.sh tXtoEON.sh wmv'
alias fortXtoEonAVI='for.sh tXtoEON.sh avi '
alias forgreatimp3='for.sh greatimp3.py'
#
alias mm_editmyautostart='sudo emacs /etc/init.d/myautostart.sh'
#alias editapt='sudo emacs -nw /etc/apt/sources.list'
alias mm_editapt='sudo gedit /etc/apt/sources.list'
#
#    NOTES
#    help ~MM~ info, help mode of my consle with my personal information ;)
#
alias mm_lsof="echo 'lsof /dev/sdd1'"
alias mm_bash_if="for i in ls *.aif; do echo $i; sox $i ${i//.aif/.wav}; done"
alias mm_iconv="echo 'iconv -f latin2 -t utf-8 That.txt  -o output'"
alias mm_eon="echo 'mencoder -oac mp3lame/copy -ovc xvid -vf scale=400:240 -xvidencopts bitrate=300 -sub $subtitles -o out.avi in.avi'"
alias mm_redirection="find / -name commands.py 2>/dev/null"
alias mm_make_iso="dd if=/dev/cdrom of=~/x
.iso"
#
#     pwsafe
#
alias mm_gorillapwsafe='password-gorilla /media/truecrypt1/moin-mobilix-pwsafe/pwsafe.dat'
#
#
alias pdfxcviewer='wine /home/magnus/bin/pdf-viewer/PDFXCview.exe'
#
alias mm_lingXonline='screen -S lingX -md python /home/magnus/django/lingXproject/manage.py runserver 0.0.0.0:9000'
#
#  to nie jest potrzebne, jezeli uruchamiasz apliakacje przez manage.py runserver !!!
#
#PYTHONPATH=/home/magnus/django/testproject/testapp
#OYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/testapp/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/
#PYTHONPATH=$PYTHONPATH:/home/magnus/django/testproject/testapp/scripts/
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace/myutilspy/
PYTHONPATH=$PYTHONPATH:/home/magnus/Dropbox/workspace/myutilspy/
PYTHONPATH=$PYTHONPATH:/home/magnus/workspace/lingX
PYTHONPATH=$PYTHONPATH:/home/magnus/django/rexproject/rexapp/utils/ 
#
#  to tez jest chyba nie potrzebne
#
PYTHONPATH=$PYTHONPATH:/home/magnus/django/
PYTHONPATH=$PYTHONPATH:/home/magnus/django/lingXproject
PYTHONPATH=$PYTHONPATH:/home/magnus/django/lingXproject/lingXapp/
#
#  to jest potrzebne :)
#
#DJANGO_SETTINGS_MODULE='lingXproject.settings'
#export DJANGO_SETTINGS_MODULE
#
EDITOR="/usr/bin/emacs22-gtk"
export set CDPATH=.:~:/home/magnus/stuff/:/home/magnus/stuff/downloads/completed/:~/stuff/video:/home/magnus/stuff/downloads/tmps 
#
#    powersaved energy
#
alias mm_superpower='sudo powersave -f'
alias mm_savepower='sudo powersave -l'
alias mm_blackscreen='/etc/acpi/screenblank.sh'
#
#    run
# 
alias rungtk_convert_only="echo 'input: funnybox.GTKbuilder.glade\n'; gtk-builder-convert funnybox.GTKbuilder.glade funnybox.xml"
alias rungtk="gtk-builder-convert funnybox.glade funnybox.xml && python "
#
#   espeak
#
alias ee="espeak "
alias xe="xclip -o -selection c | espeak"
#
#    ls
#
alias lsm='ls -m'
alias lsa='ls -a'
alias lsl='ls -l'
alias lsal='ls -al'
alias lsla='ls -al'
#
#   mplayer
#
alias mplayernovido="mplayer -novideo "
#
#    
#goto section
#settu
#
#alias cdx='cd  xlclip
alias settu='alias gotu="cd `pwd`"' # set gotu variable
alias gobet="cd /home/magnus/stuff/downloads/completed/rs/BetterSexCollection"
alias gotakeoutix="cd /media/ATV/testpdf/media/ATV/takeoutix"
alias gotmps='cd /home/magnus/stuff/downloads/tmps'
alias gohp='cd /media/HPDISK/	'
alias gomp='cd /home/magnus/django/metaserver/MetaPredictor'
alias goprogramfiles='cd "/home/magnus/.wine/drive_c/Program Files" '
alias gogetwav='cd /home/magnus/workspace/lingX/old-ones/getWav/'
alias gors='cd /home/magnus/stuff/downloads/completed/rs/'
alias gothat='cd /home/magnus/stuff/downloads/completed/rs/That70s06'
alias goX='cd /home/magnus/stuff/downloads/completed/X/'
alias dc='cd /home/magnus/stuff/downloads/completed/'
alias gofunnybox='cd /home/magnus/workspace/funnybox'
alias gomt='cd /home/magnus/stuff/workspace/masterthesis/master2010/'
#
alias dff='df -x tmpfs'
#
#    p2p
#
alias rapidshare="xclip -o > temp.ff ; echo '-----';cat temp.ff; cp -v temp.ff rapidshare.filelist.txt;echo;echo '-----';  rsdownloader temp.ff ; echo '#
 delete temprary file: temp.ff ?'; rm temp.ff"
#
#w
#
alias cleanubuntu='sudo apt-get autoclean && sudo apt-get clean && sudo apt-get autoremove'
alias cleanrar='yes | rm -r *.r* *.sfv *.nfo Sample/'
#
#   mlnet
#
alias mlnetscreen='screen -S mlnetScreen -md mlnet &'
alias mlnetrestart='rm /home/magnus/stuff/downloads/.mldonkey/downloads.ini.tmp &&  rm /home/magnus/stuff/downloads/.mldonkey/users.ini.tmp && rm /home/magnus/stuff/downloads/.mldonkey/files.ini.tmp'
#
#   eon
#
alias umounteXtreme='sudo umount /media/eXtremeStuff'
#
alias mount_force='sudo mount -t ntfs-3g /dev/sdb1 /media/hp -o force'
alias mount_force_sdd='sudo mount -t ntfs-3g /dev/sdd1 /media/hp -o force'
alias mount_force2='sudo mkdir /media/hp || sudo mount -t ntfs-3g /dev/sdb2 /media/hp -o force'
alias mount_collins='sudo mount /home/magnus/apps/collins/dictionary.collins.iso /media/collins -t iso9660 -o loop'
#
alias connect='ssh -X -v 192.168.0.10'
alias mm_tomeksStation='ssh -X -v 150.254.122.228'
#   network
#
alias o2.pl=' ping o2.pl'
alias if0='ifconfig eth0'
alias if1='ifconfig eth1'
alias iff='ifconfig'
alias ifup0='sudo ifup eth0'
alias ifup1='sudo ifup eth1'
alias ifupath='sudo ifconfig ath0 up'
alias start='sudo macchanger -m 00:16:D4:DC:C3:1F eth0 && sudo ifdown eth0 && sudo ifup eth0 && sudo dhclient eth0 && firefox '
alias inter='sudo emacs /etc/network/interfaces'
alias get_ip='sudo dhclient eth0'
alias ifset='sudo ifconfig eth0 192.168.0.1'
#
#   MAC
#
alias change_mac_home='sudo macchanger -m 00:A1:B0:00:63:13 eth0 && sudo ifdown eth0 && sudo ifup eth0'
alias change_mac_milenka='sudo macchanger -m 00:17:08:46:3C:28 eth0 && sudo ifdown eth0 && sudo ifup eth0'
alias jerzy_change_mac_jerzy='sudo macchanger -m 00:16:D4:DC:C3:1F eth0 && sudo ifdown eth0 && sudo ifup eth0 && sudo dhclient eth0'
#
#    movie
#
alias movieconsole='sudo mplayer -ao oss -vo svga '
alias beepX='play /home/magnus/.mozilla/firefox/ssfbppfu.default/extensions/{D4DD63FA-01E4-46a7-B6B1-EDAB7D6AD389}/chrome/content/downbar_finished.wav'

#
#   update/install/synaptic
#
alias update="sudo apt-get update "
alias upgrade="sudo apt-get dist-upgrade "
alias install="sudo apt-get install "
alias search="apt-cache search "
alias synaptic="gksu synaptic "
alias remove='sudo apt-get remove'
alias package_search='apt-cache search '
#
#
#alias su=’sudo -i’
#sudo -i creates a root terminal
#
#     moin
#
#alias moin='screen -S moin -md /home/magnus/stuff/moinmoin/moin-desktop/moin.py &'
#alias moin='screen -S moin -md python /media/TOSHIBA/moinmoin-mobilix-1.8/moin-desktop/wikiserver.py &'
#alias moin='screen -S moin -md python /media/HPDISK/moinmoin-mobilix-1.8/moin-desktop/wikiserver.py &'
#alias moin='screen -S moin -md python /media/ATV/moin-desktop/wikiserver.py &'
alias moin='screen -S moin -md moinfindandrun.sh'
#alias moin="python 
#
#     emacs 
#
SVN_EDITOR='emacs -rv -nw --color=never'
EDITOR='emacs -rv -nw --color=never'
export SVN_EDITOR
export PYTHONPATH
#
alias restart='source ~/.bashrc'
#
#
#
alias df='df -h'
#
#   sms 
#   apt-get install sms-pl
#
alias sms_legacz='sms -g plus -n 609246083 -m - -t "marcin"'
alias sms_mama='sms -g plus -n 661438972 -m - -t "marcin"'
alias sms_marcin='sms -g plus -n 601714835 -m - -t "marcin"'
#
#       SVN
#
alias svnls='svn ls file:///home/magnus/stuff/svn/'
#
#
#
alias rm="rm -i"
#alias rm="rmw -iv"
#alias rm_clean_waste=" -v ~/.Waste"
#
#
alias genesilico='ssh magnus@ssh.genesilico.pl'
#
alias rcemacs='emacs ~/.bashrc && restart && echo "restart..."'
#-rv
alias rcgedit='gedit  ~/.bashrc && restart && echo "restart..."'
#
#    radio
#
alias mm_afera="gmplayer http://gdansk.radio.pionier.net.pl:8000/pl/afera4.ogg"
alias mm_reagge-ulicznik='mplayer http://www.ulicznik.net/ulicznik10/sluchaj.m3u'
alias mm_streamripperreagge='streamripper http://www.ulicznik.net/ulicznik10/sluchaj.m3u'
alias mm_streetpunk-ulicznik='mplayer http://www.ulicznik.net/kanal-7/sluchaj.m3u'
alias mm_streamripperstreetpunk='streamripper http://www.ulicznik.net/kanal-7/sluchaj.m3u'
alias mm_tokfm='mplayer http://www.radio.pionier.net.pl/stream.pls?radio=radiotok'
alias mm_trojka='mplayer http://stream.polskieradio.pl/program3'
alias mm_trojkatotem='totem http://stream.polskieradio.pl/program3'
alias mm_ugandaradio='mplayer http://www.connectuganda.com/lib/nowplaying/playlists/connectuganda-low.m3u'
alias mm_bbc='totem http://www.bbc.co.uk//worldservice/meta/tx/nb/live_news_au_nb.asx'
#alias mm_bbc="smplayer -add-to-playlist http://www.bbc.co.uk/worldservice/meta/tx/nb/live/eneuk.pls"
#
##########
alias predict='./predict.py VW46S'
alias datastudio='/home/magnus/stuff/apps/datastudio/datastudio.sh'
#
#convert -border 5 -bordercolor white img_6888.jpg a.png
#
export SPDBV_USRSTUFF='/home/magnus/SPDBV/usrstuff'
export SPDBV_DOWNLOAD='/home/magnus/SPDBV/usrstuff'
export SPDBV_TEMP='/home/magnus/SPDBV/usrstuff'
###########
#
alias mirror'=ssh  mirror@150.254.176.193'
#apache2
alias ar='sudo /etc/init.d/apache2 restart'
alias ad='cd /etc/apache2/'
#
# metapredictior
#
alias mps='cd /home/magnus/django/metaserver/MetaPredictor/scripts'
alias mpt='cd /home/magnus/django/metaserver/MetaPredictor/tools'
alias mpd='cd /home/magnus/django/metaserver/MetaPredictor/'
alias mprun='python /home/magnus/django/metaserver/manage.py runserver'
alias jobd='~/django/metaserver/MetaPredictor/resultfiles/VW46S'
#     
#      wine
#
alias et="wine /home/magnus/.wine/drive_c/Program\ Files/Techland/English\ Translator\ XT/EnglishTranslator.exe"
alias djview="wine /home/magnus/bin/software.WinDjView-0.5.exe "
alias pdfviewerpro='wine "/home/magnus/.wine/dosdevices/c:/Program Files/Tracker Software/PDF-XChange Viewer/pdf-viewer/PDFXCview.exe" '
#
alias screenshot-installed='dpkg --get-selections > installed-software-kadu-skype-mocp-amule-thunderbird-firefox-addon'
alias malibu='gedit  ~/stuff/many-diff-files/malibu.txt'
alias sls='screen -ls'

#
#
#
export HMMTOP_ARCH='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export HMMTOP_PSV='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export PSORT_ROOT='/home/magnus/django/metaserver/MetaPredictor/tools/bio-tools-psort-all/psort'
export PSORT_HMMTOP='/home/magnus/django/metaserver/MetaPredictor/tools/hmmtop_2.1'
export PSORT_PFTOOLS='/home/magnus/django/metaserver/MetaPredictor/tools/pftools'
export BLASTDIR='/usr/bin/'

#

#

PATH=$PATH:/home/magnus/django/metaserver/MetaPredictor/tools/TMHMM2.0c/bin
PATH=$PATH:/home/magnus/bin
PATH=$PATH:/home/magnus/workspace
PATH=$PATH:/home/magnus/workspace/myutil
PATH=$PATH:/home/magnus/workspace/myutilspy/
PATH=$PATH:/home/magnus/workspace/sync/
PATH=$PATH:/home/magnus/workspace/
PATH=$PATH:/home/magnus/bin/pythoniczki
PATH=$PATH:/home/magnus/workspace/pythonlibs
PATH=$PATH:/home/magnus/workspace/lingX/
#R
export RHOME='/usr/local/lib/R'




# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color)
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;
*)
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    ;;
esac

# Comment in the above and uncomment this below for a color prompt
#PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='ls --color=auto --format=vertical'
    #alias vdir='ls --color=auto --format=long'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi
#
#    BY >
#
alias rsyncbin="rsync -av ~/bin/ sv:~/bin/"
alias rsyncworkspace="rsync -av workspace/ sv:~/workspace/" 
alias rsyncworkspace="rsync -av ~/workspace/ sv:~/workspace/" 

alias rsyncEON='rsync -av --delete /media/EON/ /home/magnus/stuff/backups-EON/'
alias rsyncmp3='rsync -vur --delete /home/magnus/stuff/music/downloads/mp3/ /media/EON/music/mp3/'


### / - nie tworz katalogu
alias mm_ff_pull='rsync -avrz --exclude firefox/ssfbppfu.default/Cache maximus:~/.mozilla/ /home/magnus/.mozilla/'
#--progress --stats 
alias mm_ff_push='rsync -avrz --exclude firefox/ssfbppfu.default/Cache /home/magnus/.mozilla/ maximus:~/.mozilla/'

alias mm_backups_push='rsync -avrz /home/magnus/backups/backups-full/ maximus:~/backups/backups-full/'


#alias sync='rsync -avz --delete maximus:~/sync/ /home/magnus/sync/'

alias mm_th_pull='rsync --progress -avrz maximus:~/.thunderbird/ /home/magnus/.thunderbird/'
#--progress --stats 
alias mm_th_push='rsync --progress -avrz /home/magnus/.thunderbird/ maximus:~/.thunderbird/'


#alias mm_ff_push_test='rsync -uvr --progress /media/truecrypt2/.mozilla/ maximus:~/.mozilla/'

#-t preseve modifination time
#-n dry run
alias mm_workspace_push='rsync -uvr -t -h --progress /home/magnus/stuff/workspace/myutil/ maximus:~/workspace/myutil/'
alias mm_workspace_pop='rsync -uvr -t -h --progress maximus:~/workspace/myutil/ /home/magnus/stuff/workspace/myutil/'
alias mm_workspace_sync='mm_workspace_push && mm_workspace_pop' 
#rsync -uvr -t -h --progress maximus:~/workspace/myutil/ /home/magnus/stuff/workspace/myutil/'



alias mm_thunder_push='rsync -uvr /home/magnus/stuff/mirrorofhome/DO_.thunderbird/ maximus:~/.thunderbird'
alias mm_thunder_pop='rsync -uvr maximus:~/.thunderbird/ /home/magnus/.thunderbird'


alias mm_mendeley_to_maximux="rsync -uvr '/home/magnus/MyMendeleyLibrary/' 'maximus:/home/magnus/MyMendeleyLibrary/'"
alias mm_mendeley_from_maximus="rsync -uvr 'maximus:/home/magnus/MyMendeleyLibrary/' '/home/magnus/MyMendeleyLibrary/'"

alias mm_netbook='ssh -X 192.168.2.95'

alias gm="gmplayer "
alias lingXonline="screen -mdS lingXonline /home/magnus/bin/start_lingXonline.sh"
#
#external monitor
alias mm_exmonitor_off="xrandr --output VGA-0 --off"
#alias exmonitor_on="xrandr --output VGA-0 --mode 1280x1024"
#alias mm_exmonitor_on="xrandr --output VGA-0 --mode 1280x1024 --right-of LVDS"
alias mm_exmonitor_on="xrandr --output VGA-0 --mode 1440x900 --right-of LVDS"

#17calowy taki ma --mode 1280x1024 --right-of LVDS
alias mm_asus_on="xrandr --output VGA-0 --mode 1440x900 --right-of LVDS"
alias mm_addborder="echo 'convert -border 5x5 -bordercolor "#000" p.copy.png p.c.png'"

alias mm_limitmencoder="cpulimit  -e mencoder -l 50 -v"
alias mm_limitmencoder30="cpulimit  -e mencoder -l 30 -v"
#
alias mm_limitfirefox="cpulimit  -e firefox-bin -l 50 -v"
alias mm_mytrain="kipina /home/magnus/.kipina/mytraining.xml &"
alias gstart="gnome-session"
alias mm_backup_mindmapp="fwbackups-run -v 'mindmaping'"
alias mm_screenshot="import -frame /home/magnus/Desktop/temp.png"

alias mm_mod1='perl proces.pl set02.txt > set2.neurons.cvs && head set2.neurons.cvs'
alias sqlfb='sqlitebrowser funnybox.db'
alias mm_thinkingrock="/home/magnus/apps/archives-pkgs/tr-2.2.1-with-jre/bin/tr.sh"
alias mm_fbcopy="cp -r -v /home/magnus/stuff/workspace/funnybox/ /media/disk/"

#install#the best way!!! and genome browser works after that
alias mm_install_java="apt-get install default-jre"


### ntfs-3g
alias mm_ntfs_info="echo 'sudo ntfs-3g /dev/sda1 /media/stick -o force'"
alias mm_ntfs_mount="sudo ntfs-3g /dev/sda1 /media/stick -o force"


alias mm_tXcopyflash="cp -uv /tmp/Flash* /media/EON/youtube/" 
alias mm_flashopen="smplayer /tmp/Flash*"
### define where to save
alias mm_flashconvert="cd /tmp && tXtoEON.sh Flas* avi && mv -v /tmp/Flas*avi /home/magnus/temp_flv"

alias pdfl="pdflatex -interaction nonstopmode "

alias gobiologiasytemow="cd /home/magnus/stuff/studies/biologiasystemow_V_2009/project"
alias gomemeingalaxy="cd /home/magnus/stuff/studies/biologiasystemow_V_2009/project/galaxy/galaxy_dist/tools/meme"
alias youtube2mp3_xclip="xclip -o > temp ; youtube2mp3.py temp"


alias goweightless302="cd /home/magnus/workspace/weightless_r_package/weightless302"
alias goweightless="cd /home/magnus/workspace/weightless_r_package/"

alias wwcompile="gcc -c fromphylip.c && gcc -c weightless.c && gcc  weightless.o fromphylip.o -lm -o weightless && echo 'done'"

alias wwbuildinstall="R CMD build weightless && sudo R CMD INSTALL weightless_0.1.tar.gz"
alias wwbuild="R CMD build weightless"
alias wwinstall="sudo R CMD INSTALL weightless_0.1.tar.gz"

alias gomaster="cd /home/magnus/workspace/masterthesis/master2010"
alias gorex="cd /home/magnus/django/rex"

alias smplayeradd="smplayer -add-to-playlist "

#alias rapidshare="xclip -o > temp ; echo '-----';cat temp.ff; cp -v temp.ff #rapidshare.filelist.txt;echo;echo '-----';  rsdownloader temp.ff ; echo '#
# delete temprary file: temp.ff ?'; rm temp.ff"
alias mm_ff38="/home/magnus/apps/firefox-3.6.8/firefox/firefox"
alias mm_ff35="/home/magnus/apps/firefox-3.5.15/firefox"

alias gita="git add "
alias gitc="git commit -m "
alias gits="git status"
alias mm_domaster="pdftk A=intro.pdf B=master02.pdf cat A B3-end output marcin-magnus-mgr.pdf"

alias mm_pkg2install="gedit /home/magnus/stuff/mirrorofhome/pkgs/pkgs2install.txt"
alias xmind='/home/magnus/apps/archives-pkgs/mindmapping/xmind/XMind_Linux/xmind'
alias mm_lifemy='xmind /media/truecrypt1/moin-mobilix-lifemap/lifemy.xmind'
###internet akademik
alias mm_akademik="ssh 85092616739@www.sds.uw.edu.pl"
alias mm_freerapid="/home/magnus/stuff/apps/archives-pkgs/freerapid/FreeRapid-0.83u1/frd.sh"

alias mm_openvpn="sudo openvpn --verb 9 --cd .openvpn --config openvpn-magnus-fileAS84MI.conf"
# --daemon ~/vpndaemon"
alias mm_openvpnd="sudo openvpn --cd .openvpn --config openvpn-magnus-fileAS84MI.conf --daemon ~/vpndaemon"
alias mm_openvpn_deamon="sudo openvpn  --cd .openvpn/ --config openvpn-magnus-fileAS84MI.conf --daemon ~/logfile"
alias mm_switchoff30="sudo shutdown -h 30"
alias mm_switchoff90="sudo shutdown -h 90"

alias mm_maximus="ssh -X 192.168.2.94"
alias mm_tuxguitar="timidity -iA -Os"
alias mm_isomount="mount -o loop -t iso9660 file.iso /mnt/test"
alias mm_mountiso="mount -o loop -t iso9660 file.iso /mnt/test"
alias mm_pinggoogle='ping 66.102.13.105'

alias msearch="python /home/magnus/workspace/mediacenter/mediacenter.py search "
alias mm_torrentsendtomaximus="scp -v /home/magnus/stuff/downloads/watch/*.torrent maximus:~/Downloads/watch/"
alias mm_foldit="cd /home/magnus/apps/foldit/Foldit"
### works
alias mm_starthenry="LANG=pl_PL.utf8 wine '/home/magnus/.wine/drive_c/Program Files/Edgard/Profesor Henry 6.0 Słownictwo/p_slownictwo_60.exe'"

export RASP="/home/magnus/rna/RASP/rasp-fd-1.0/"
alias mm_pydoc=" cd ~/django/metaserver/MetaPredictor/scripts/; pydoc -p 9998"
alias mm_restartdropbox="dropbox stop && dropbox start"
alias mm_runrex="cd /home/magnus/django/rex/rexproject; python manage.py runserver"

